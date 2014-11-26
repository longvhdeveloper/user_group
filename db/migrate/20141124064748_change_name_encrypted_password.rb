class ChangeNameEncryptedPassword < ActiveRecord::Migration
  def change
    rename_column :users, :encrtyped_password, :encrypted_password
  end
end
