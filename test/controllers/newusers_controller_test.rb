require 'test_helper'

class NewusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newuser = newusers(:one)
  end

  test "should get index" do
    get newusers_url
    assert_response :success
  end

  test "should get new" do
    get new_newuser_url
    assert_response :success
  end

  test "should create newuser" do
    assert_difference('Newuser.count') do
      post newusers_url, params: { newuser: { email: @newuser.email, login: @newuser.login, name: @newuser.name } }
    end

    assert_redirected_to newuser_url(Newuser.last)
  end

  test "should show newuser" do
    get newuser_url(@newuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_newuser_url(@newuser)
    assert_response :success
  end

  test "should update newuser" do
    patch newuser_url(@newuser), params: { newuser: { email: @newuser.email, login: @newuser.login, name: @newuser.name } }
    assert_redirected_to newuser_url(@newuser)
  end

  test "should destroy newuser" do
    assert_difference('Newuser.count', -1) do
      delete newuser_url(@newuser)
    end

    assert_redirected_to newusers_url
  end
end
