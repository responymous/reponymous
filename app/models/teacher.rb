class Teacher < ActiveRecord::Base
  has_many :students
  has_many :topics
  belongs_to :current_topic, class_name: "Topic"
  has_secure_password

  def reset_topic(teacher)
    teacher.current_topic_id = nil
    teacher.save
  end
end
