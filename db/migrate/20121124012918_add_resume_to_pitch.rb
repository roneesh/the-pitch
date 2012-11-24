class AddResumeToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :resume, :string
  end
end
