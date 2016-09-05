require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get websites" do
    sign_out :user
    get :websites, params: { key: api_keys(:one).key }
    assert_response(200)
  end

  test "should get admins" do
    sign_out :user
    get :admins, params: { key: api_keys(:one).key }
    assert_response(200)
  end

  test "should get techs" do
    sign_out :user
    get :techs, params: { key: api_keys(:one).key }
    assert_response(200)
  end

  test "should get registrars" do
    sign_out :user
    get :registrars, params: { key: api_keys(:one).key }
    assert_response(200)
  end

  test "should create website" do
    sign_out :user
    post :create_website, params: { key: api_keys(:one).key, website: { url: "http://test-site.com/", admin_id: admins(:one).id, tech_id: teches(:one).id, registrar_id: registrars(:one).id } }
    assert_response(200)
  end

  test "should create admin" do
    sign_out :user
    post :create_admin, params: { key: api_keys(:one).key, admin: { name: "TestAdmin", email: "t.admin@example.com" } }
    assert_response(200)
  end

  test "should create tech" do
    sign_out :user
    post :create_tech, params: { key: api_keys(:one).key, tech: { name: "TestTech", email: "t.tech@example.com" } }
    assert_response(200)
  end

  test "should create registrar" do
    sign_out :user
    post :create_registrar, params: { key: api_keys(:one).key, registrar: { name: "TestRegistrar", email: "t.reg@example.com" } }
    assert_response(200)
  end
end
