class ScoresController < ApplicationController
  def create
    Score.create!(score_params)
    render nothing: true
  end

  private def score_params
    params.require(:score).permit(:student_id, :topic_id, :score)
  end

end
