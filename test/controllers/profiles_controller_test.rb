require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
	test "should show profile" do
		@user = users(:one)
    	get :show, id: @user
    assert_response :success
  end
end
