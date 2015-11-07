class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :scores
  has_secure_password
 end
