class AddAvatarToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :avatar, :string
    add_column :pitches, :resume, :string
  end
end
