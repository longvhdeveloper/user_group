class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password, :limit => 20
      t.string :name
      t.text :profile
      t.boolean :is_admin, :default => false
      t.timestamps
    end
  end
end
