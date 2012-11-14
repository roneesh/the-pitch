class AddShortToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :short_url, :string
  end
end
