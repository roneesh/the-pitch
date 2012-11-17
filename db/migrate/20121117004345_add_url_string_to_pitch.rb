class AddUrlStringToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :url_string, :string
  end
end
