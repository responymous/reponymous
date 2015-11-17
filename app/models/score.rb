class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :topic
  after_create :calculate_average_thus_far

  private
  def calculate_average_thus_far
    self.update!(average_thus_far: topic.score_average)
  end
end

  # Average score based on scores input by students.


  # 1. narrow by the topic  -- topic id
  # 2. narrow by the teacher  -- teacher id
  # 3. avg all student scores beloning the the corresponding topic/teacher

  #localhost:8000/teachers/{teacher_id}
  #localhost:8000/teachers/{teacher_id}/{topic_id}
  #PARAMS
