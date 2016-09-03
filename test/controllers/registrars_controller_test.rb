require 'test_helper'

class RegistrarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_out :user
    get :index
    assert_response 200
  end

  test "should get show" do
    sign_out :user
    get :show, params: { id: registrars(:one).id }
    assert_response 200
  end

  test "should get new" do
    sign_in users(:standard)
    get :new
    assert_response 200
  end

  test "should create new registrar" do
    sign_in users(:standard)
    post :create, params: { registrar: { name: "registrar3", url: "http://registrar3.com/", email: "registrar@registrarorg3.com", phone: "33333333333" } }
    assert_response 302
  end

  test "should get edit" do
    sign_in users(:standard)
    get :edit, params: { id: registrars(:one).id }
    assert_response 200
  end

  test "should update existing registrar" do
    sign_in users(:standard)
    patch :update, params: { id: registrars(:one).id, registrar: { name: "registrar4", url: "http://registrar4.com/", email: "registrar@registrarorg4.com", phone: "44444444444" } }
    assert_response 302
  end

  test "should destroy registrar" do
    sign_in users(:admin)
    delete :destroy, params: { id: registrars(:one).id }
    assert_response 302
  end
end
