class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :topic

  # Average score based on scores input by students.
  # def score_avg
  #   student_scores = Array.new
  #
  #   students.all.each do |student|
  #     if student.score != nil
  #       student_scores << student.score
  #     end
  #   end
  #   average = student_scores.sum.to_f / student_scores.length
  #   average.round(1)
  # end
  #
  #
  # def score_count
  #   @score = Score.count
  # end
end
