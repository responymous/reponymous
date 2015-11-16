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
    hash = {}
    scores.each do |score|
      hash[score.topic] ||= []
      hash[score.topic] << score.score
    end

    scores_array = []
    hash.each do |topic, numbers|
      scores_array << {topic: topic.title, average: numbers.sum.to_f / numbers.count}
    end
    scores_array
  end

end
