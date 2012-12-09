class AddDescriptiveUrlToPitch < ActiveRecord::Migration
  def change
  	add_column :pitches, :descriptive_url, :string
  end
end
