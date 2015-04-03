require 'test_helper'

class JobsearchControllerTest < ActionController::TestCase
  test "should get jobs" do
    get :jobs
    assert_response :success
  end

end
