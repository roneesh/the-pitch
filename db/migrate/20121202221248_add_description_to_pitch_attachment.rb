class AddDescriptionToPitchAttachment < ActiveRecord::Migration
  def change
    add_column :pitch_attachments, :description, :string
  end
end
