class AddAverageThusFarToScore < ActiveRecord::Migration
  def change
    add_column :scores, :average_thus_far, :float
  end
end
