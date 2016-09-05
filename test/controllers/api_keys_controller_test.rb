require 'test_helper'

class ApiKeysControllerTest < ActionController::TestCase
  test "should get index" do
    sign_in users(:admin)
    get :index
    assert_response(200)
  end

  test "should get new" do
    sign_in users(:admin)
    get :new
    assert_response(200)
  end

  test "should create key" do
    sign_in users(:admin)
    post :create, params: { api_key: { key: 'cfac59c286580d44a41cf80f5f9765ba3db437dd3cb4f1c5b3440b7fc6da0710', app_name: 'TestApp', user_id: users(:standard).id } }
    assert_response(200)
  end

  test "should get edit" do
    sign_in users(:admin)
    get :edit, params: { id: api_keys(:one).id }
    assert_response(200)
  end

  test "should update key" do
    sign_in users(:admin)
    patch :update, params: { id: api_keys(:one).id, api_key: { key: '1e97a21c6203b0953ab78c210a5885ccb9abfc6b35631bf211a94a6832a3be52', app_name: 'TestApp', user_id: users(:standard).id } }
    assert_response(200)
  end

  test "should destroy key" do
    sign_in users(:admin)
    delete :destroy, params: { id: api_keys(:one).id }
    assert_response(200)
  end
end
