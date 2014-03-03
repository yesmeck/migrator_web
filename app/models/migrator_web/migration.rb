module MigratorWeb
  class Migration
    include ActiveModel::Model

    attr_accessor :id, :name, :status

    def down
      ActiveRecord::Migrator.run(:down, self.class.paths, id.to_i)
    end

    def up
      ActiveRecord::Migrator.run(:up, self.class.paths, id.to_i)
    end

    def redo
      down
      up
    end

    def to_param
      id
    end

    class << self
      def all
        db_list = ActiveRecord::Base.connection.select_values("SELECT version FROM #{ActiveRecord::Migrator.schema_migrations_table_name}")
        db_list.map! { |version| "%.3d" % version }
        file_list = []
        self.paths.each do |path|
          Dir.foreach(path) do |file|
            # match "20091231235959_some_name.rb" and "001_some_name.rb" pattern
            if match_data = /^(\d{3,})_(.+)\.rb$/.match(file)
              status = db_list.delete(match_data[1]) ? 'up' : 'down'
              file_list << [status, match_data[1], match_data[2].humanize]
            end
          end
        end
        db_list.map! do |version|
          ['up', version, '********** NO FILE **********']
        end
        migtaions = []
        (db_list + file_list).sort_by {|m| m[1]}.each do |migration|
          migtaions << self.new(id: migration[1], name: migration[2], status: migration[0])
        end
        migtaions
      end

      def paths
        ActiveRecord::Migrator.migrations_paths.map { |path| File.join([Rails.root, path])  }
      end
    end
  end

end
