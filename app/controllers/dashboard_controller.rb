class DashboardController < ApplicationController
  before_action :logged_in?

  def teacher_dashboard
    @score_average = Student.score_avg
    @reset = Student.reset_score
  end


  def student_dashboard
  end
end
