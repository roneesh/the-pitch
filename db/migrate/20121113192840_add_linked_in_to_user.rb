class AddLinkedInToUser < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_script, :string
  end
end
