class RemoveScoreFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :score, :integer
  end
end
