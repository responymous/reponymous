class AddCurrentTopicToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :current_topic, :string
  end
end
