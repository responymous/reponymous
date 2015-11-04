class Teacher < ActiveRecord::Base
  has_many :students
  has_many :scores
  has_secure_password
end
