class ScoresController < ApplicationController
  def change
    s = Score.where(student_id: params[:student_id], topic_id: params[:topic_id]).first
    if s != nil
      s.update!(score: params[:score])
    else
      Score.create!(score: params[:score], student_id: params[:student_id], topic_id: params[:topic_id])
    end
    render nothing: true
  end
end
