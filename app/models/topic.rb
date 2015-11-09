class Topic < ActiveRecord::Base
  has_many :scores
  belongs_to :teacher

  @topic_scores = Array.new

  def score_count

  end

  def score_average
    @topic_scores = Score.where(topic_id: @teacher)
    # @topic_scores.average(:score).round(1).to_f


    # @topic_scores = Score.where(topic_id: 1)
    # topic_scores.average(:score).to_f

    # teacher..each do |student|
    #   if student.score != nil
    #     topic_scores << student.score
    #   end
    # end
    # average = student_scores.sum.to_f / student_scores.length
    # average.round(1)
  end


end
