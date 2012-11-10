class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :pitch_id
      t.string :resource_url

      t.timestamps
    end
  end
end
