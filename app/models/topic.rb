
class Topic < ActiveRecord::Base
  has_many :scores
  belongs_to :teacher

  @topic_scores = Array.new

  def score_count

  end

  def score_average
    @topic_scores = Score.where(topic_id: @teacher)
  end



    # @topic_scores.average(:score).round(1).to_f

    # @topic_scores = Score.where(topic_id: 1)
    # topic_scores.average(:score).to_f

    # teacher..each do |student|
    #   if student.score != nil
    #     topic_scores << student.score
    #   end
    # end
    # average = student_scores.sum.to_f / student_scores.length
    # average.round(1)



end

# irb(main):010:0> danais_scores = Score.where(topic_id: 1)
#   Score Load (0.2ms)  SELECT "scores".* FROM "scores" WHERE "scores"."topic_id" = ?  [["topic_id", 1]]
# => #<ActiveRecord::Relation [#<Score id: 1, score: 6, topic_id: 1, student_id: 1, created_at: "2015-11-07 22:55:01", updated_at: "2015-11-07 22:55:01">, #<Score id: 2, score: 6, topic_id: 1, student_id: 2, created_at: "2015-11-07 22:55:01", updated_at: "2015-11-07 22:55:01">, #<Score id: 3, score: 6, topic_id: 1, student_id: 4, created_at: "2015-11-07 22:55:01", updated_at: "2015-11-07 22:55:01">]>
# irb(main):011:0> danais_scores.average(:id).to_f
#    (0.3ms)  SELECT AVG("scores"."id") FROM "scores" WHERE "scores"."topic_id" = ?  [["topic_id", 1]]
# => 2.0
# irb(main):012:0> danais_scores.average(:score).to_f
#    (0.2ms)  SELECT AVG("scores"."score") FROM "scores" WHERE "scores"."topic_id" = ?  [["topic_id", 1]]
# => 6.0
# irb(main):013:0> danais_scores.count
#    (0.2ms)  SELECT COUNT(*) FROM "scores" WHERE "scores"."topic_id" = ?  [["topic_id", 1]]
# => 3
# irb(main):014:0> danais_scores.count(:score)
#    (0.3ms)  SELECT COUNT("scores"."score") FROM "scores" WHERE "scores"."topic_id" = ?  [["topic_id", 1]]
# => 3
# irb(main):015:0> danais_scores.count(:score)
