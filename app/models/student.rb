class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :scores
  has_secure_password

  # # Average score based on scores input by students.
  # def self.score_avg
  #   student_scores = Array.new
  #
  #   self.all.each do |student|
  #     if student.score != nil
  #       student_scores << student.score
  #     end
  #   end
  #   average = student_scores.sum.to_f / student_scores.length
  #   average.round(1)
  # end
end
