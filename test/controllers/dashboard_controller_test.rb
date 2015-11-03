require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get teacher_dashboard" do
    get :teacher_dashboard
    assert_response :success
  end

  test "should get student_dashboard" do
    get :student_dashboard
    assert_response :success
  end

end
