class RemoveCurrentTopicFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :current_topic, :string
  end
end
