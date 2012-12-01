class AddNameToPitchattachment < ActiveRecord::Migration
  def change
    add_column :pitch_attachments, :name, :string
  end
end
