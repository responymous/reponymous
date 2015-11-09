class DashboardController < ApplicationController
  before_action :logged_in?

  def teacher_dashboard
    @teacher = Teacher.find_by_id(session[:user_id])
    @topic_scores = Score.where(topic_id: 2)

    # @average = Score.where(student_id: @current_user).score_avg
  end


  def student_dashboard
  end



  # For this to work...
  #   * set up a post route to get here
  #   * change the link in the view to come here instead
  # def reset
  #   Student.reset_score
  #   redirect_to teacher_dashboard_path
  # end
end
