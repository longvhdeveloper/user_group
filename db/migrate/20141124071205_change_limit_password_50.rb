class ChangeLimitPassword50 < ActiveRecord::Migration
  def change
    change_column :users, :encrypted_password, :string, :limit => 50
  end
end
