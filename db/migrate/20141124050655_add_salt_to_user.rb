class AddSaltToUser < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string, :limit => 40
    rename_column :users, :password, :encrtyped_password
  end
end
