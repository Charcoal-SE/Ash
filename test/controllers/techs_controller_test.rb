require 'test_helper'

class TechsControllerTest < ActionController::TestCase
  test "should get index" do
    sign_out :user
    get :index
    assert_response 200
  end

  test "should get show" do
    sign_out :user
    get :show, params: { id: teches(:one).id }
    assert_response 200
  end

  test "should get new" do
    sign_in users(:standard)
    get :new
    assert_response 200
  end

  test "should create new tech" do
    sign_in users(:standard)
    post :create, params: { tech: { name: "tech3", org: "techOrg3", country: "UK", email: "tech@techorg3.com", phone: "33333333333" } }
    assert_response 302
  end

  test "should get edit" do
    sign_in users(:standard)
    get :edit, params: { id: teches(:one).id }
    assert_response 200
  end

  test "should update existing tech" do
    sign_in users(:standard)
    patch :update, params: { id: teches(:one).id, tech: { name: "tech4", org: "techeOrg4", country: "Sweden", email: "tech@techorg4.com", phone: "44444444444" } }
    assert_response 302
  end

  test "should destroy tech" do
    sign_in users(:admin)
    delete :destroy, params: { id: teches(:one).id }
    assert_response 302
  end
end
