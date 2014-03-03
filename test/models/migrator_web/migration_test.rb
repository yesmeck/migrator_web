require 'test_helper'
require 'active_record'

module MigratorWeb
  class MigrationTest < ActiveSupport::TestCase
    test 'get all migrations' do
      migrations = Migration.all
      assert_equal 3, migrations.count
      assert_equal '20140303200211', migrations.first.id
    end
  end
end
