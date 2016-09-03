require 'test_helper'

class WebsitesControllerTest < ActionController::TestCase
  test "should get index" do
    sign_out :user
    get :index
    assert_response 200
  end

  test "should get show" do
    sign_out :user
    get :show, params: { id: websites(:one).id }
    assert_response 200
  end

  test "should get new" do
    sign_in users(:standard)
    get :new
    assert_response 200
  end

  test "should create new website" do
    sign_in users(:standard)
    post :create, params: { website: { url: "http://website3.com/", name_server: "ns3.server3.com", post_count: 1 } }
    assert_response 302
  end

  test "should get edit" do
    sign_in users(:standard)
    get :edit, params: { id: websites(:one).id }
    assert_response 200
  end

  test "should update existing website" do
    sign_in users(:standard)
    patch :update, params: { id: websites(:one).id, website: { url: "http://website4.com/", name_server: "ns4.server4.com", post_count: 789 } }
    assert_response 302
  end

  test "should destroy website" do
    sign_in users(:admin)
    delete :destroy, params: { id: websites(:one).id }
    assert_response 302
  end
end
