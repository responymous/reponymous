class DashboardController < ApplicationController
  before_action :logged_in?

  def teacher_dashboard
    @score_average = Student.score_avg
  end


  def student_dashboard
  end
end
