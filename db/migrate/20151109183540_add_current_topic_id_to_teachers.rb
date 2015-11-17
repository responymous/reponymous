class AddCurrentTopicIdToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :current_topic_id, :integer
  end
end
