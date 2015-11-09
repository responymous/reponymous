require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  test "should get change_topic" do
    get :change_topic
    assert_response :success
  end

end
