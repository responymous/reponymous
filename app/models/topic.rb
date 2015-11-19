
class Topic < ActiveRecord::Base
  has_many :scores
  belongs_to :teacher

  def score_count
    last_scores.count
  end

  def score_average
    last_scores.blank? ? 0 : last_scores.sum(&:score).to_f/score_count
  end

  def last_scores
    hash = {}
    scores.each do |score|
      hash[score.student] = score if hash[score.student].nil? || score.created_at > hash[score.student].created_at
    end
    hash.values
  end

  #return an array of hashes
  def all_scores
    scores_array = []
    self.scores.each do |score|
      scores_array << {date: score.created_at, close: score.average_thus_far}
    end
    scores_array
  end
end
