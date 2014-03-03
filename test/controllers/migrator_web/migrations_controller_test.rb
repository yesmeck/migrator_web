require 'test_helper'

module MigratorWeb
  class MigrationsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index, use_route: :migrator_web
      assert_response :success
    end
  end
end
