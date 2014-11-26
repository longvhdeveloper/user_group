class ChangeLimitPassword < ActiveRecord::Migration
  def change
    change_column :users, :encrypted_password, :string, :limit => 32
  end
end
