class Student < ActiveRecord::Base
  belongs_to :teacher
  has_secure_password
end
