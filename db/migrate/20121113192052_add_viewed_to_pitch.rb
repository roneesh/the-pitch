class AddViewedToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :viewed, :boolean
  end
end
