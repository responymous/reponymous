class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :topic

  # Average score based on scores input by students.


  # 1. narrow by the topic  -- topic id
  # 2. narrow by the teacher  -- teacher id
  # 3. avg all student scores beloning the the corresponding topic/teacher

  #localhost:8000/teachers/{teacher_id}
  #localhost:8000/teachers/{teacher_id}/{topic_id}
  #PARAMS


  def self.average
    scores = Array.new

    topic_score = self.where(topic_id: 1)
    topic_score.each do |n|
      scores << n.score
    end
    [scores.length, scores.sum.to_f / scores.length]
    # {"Count" => scores.length ,"Average" => scores.sum / scores.length}
  end

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

end
