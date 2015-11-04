class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :scores 
  has_secure_password

  # Average score based on scores input by students.
  def self.score_avg
    student_scores = Array.new

    self.all.each do |student|
      student_scores << student.score
    end
    student_scores.sum.to_f / student_scores.length
  end


end
