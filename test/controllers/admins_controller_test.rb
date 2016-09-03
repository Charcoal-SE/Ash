require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get index" do
    sign_out :user
    get :index
    assert_response 200
  end

  test "should get show" do
    sign_out :user
    get :show, params: { id: admins(:one).id }
    assert_response 200
  end

  test "should get new" do
    sign_in users(:standard)
    get :new
    assert_response 200
  end

  test "should create new admin" do
    sign_in users(:standard)
    post :create, params: { admin: { name: "Admin3", org: "AdminOrg3", country: "UK", email: "admin@adminorg3.com", phone: "33333333333" } }
    assert_response 302
  end

  test "should get edit" do
    sign_in users(:standard)
    get :edit, params: { id: admins(:one).id }
    assert_response 200
  end

  test "should update existing admin" do
    sign_in users(:standard)
    patch :update, params: { id: admins(:one).id, admin: { name: "Admin4", org: "AdminOrg4", country: "Sweden", email: "admin@adminorg4.com", phone: "44444444444" } }
    assert_response 302
  end

  test "should destroy admin" do
    sign_in users(:admin)
    delete :destroy, params: { id: admins(:one).id }
    assert_response 302
  end
end
