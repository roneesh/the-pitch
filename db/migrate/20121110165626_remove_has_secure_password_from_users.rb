class RemoveHasSecurePasswordFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :has_secure_password
  end

  def down
    add_column :users, :has_secure_password, :string
  end
end
