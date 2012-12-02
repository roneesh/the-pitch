class AddVideoLinkToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :video_link, :string
  end
end
