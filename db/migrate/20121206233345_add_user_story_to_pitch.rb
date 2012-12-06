class AddUserStoryToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :user_story, :text
  end
end
