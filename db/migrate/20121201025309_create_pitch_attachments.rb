class CreatePitchAttachments < ActiveRecord::Migration
  def change
    create_table :pitch_attachments do |t|
      t.integer :pitch_id
      t.integer :user_id

      t.timestamps
    end
  end
end
