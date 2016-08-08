require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get no_route" do
    get :no_route
    assert_response :success
  end

end
