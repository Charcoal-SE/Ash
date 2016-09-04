require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    sign_out :user
    get :index
    assert_response 200
  end
end
