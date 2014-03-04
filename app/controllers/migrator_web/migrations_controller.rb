require_dependency "migrator_web/application_controller"

module MigratorWeb
  class MigrationsController < ApplicationController
    def index
      @migrations = Migration.all
    end

    [:down, :up, :redo].each do |method|
      define_method(method) do
        @migration = Migration.new(id: params[:id])
        @migration.send(method)
        render :done
      end
    end
  end
end
