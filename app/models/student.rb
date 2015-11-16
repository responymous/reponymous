class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :scores
  has_secure_password

  def current_topic_title
    if teacher.current_topic
      teacher.current_topic.title
    else
      "(None)"
    end
  end

  def student_topics
    scores_array = []
    self.scores.each do |score|
      scores_array << {topic: score.topic_id, average: score.average_thus_far}
    end
    scores_array
  end

end
