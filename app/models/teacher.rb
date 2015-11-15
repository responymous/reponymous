class Teacher < ActiveRecord::Base
  has_many :students
  has_many :topics
  belongs_to :current_topic, class_name: "Topic"
  after_create :all_topics
  has_secure_password

  def all_topics
    topics_array = []
    self.topics.each do |topic|
      topics_array << {topic: topic.title, average: topic.score_average}
    end
    topics_array
  end

end
