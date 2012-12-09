class AddBackgroundImageToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :background_image, :string
  end
end
