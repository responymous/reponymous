class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :topic_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
