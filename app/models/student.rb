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
end
