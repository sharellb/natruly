require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  setup do
    @user = users(:one)
  end

  test "should get new" do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    get :new
    assert_response :success
  end
end