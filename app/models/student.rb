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
    topics_array = []
    self.topics.each do |topic|
      topics_array << {topic: topic.title, average: topic.score_average}
    end
    topics_array
  end

end
