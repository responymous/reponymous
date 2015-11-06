class Topic < ActiveRecord::Base
  has_many :scores
  belongs_to :teacher

end
