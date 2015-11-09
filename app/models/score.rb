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

end
