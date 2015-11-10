class ScoresController < ApplicationController
  def change
    s = Score.where(student_id: params[:score][:student_id], topic_id: params[:score][:topic_id]).first
    if s != nil
      s.update!(score: params[:score][:score])
    else
      Score.create!(score_params)
    end
    render nothing: true
  end

  private def score_params
    params.require(:score).permit(:student_id, :topic_id, :score)
  end

end
