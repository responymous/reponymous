class DashboardController < ApplicationController
  before_action :teachers_only, except: :student_dashboard
  before_action :students_only, only: :student_dashboard

  def teacher_dashboard
    @teacher = @current_user
    @topic_scores = Score.where(topic_id: @current_user.current_topic_id)

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
