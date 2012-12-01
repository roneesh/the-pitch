class AddAttachmentToPitchAttachment < ActiveRecord::Migration
  def change
    add_column :pitch_attachments, :attachment, :string
  end
end
