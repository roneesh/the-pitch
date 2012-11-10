class AddAttachmentProfilepicToPitches < ActiveRecord::Migration
  def self.up
    change_table :pitches do |t|
      t.has_attached_file :profilepic
    end
  end

  def self.down
    drop_attached_file :pitches, :profilepic
  end
end
