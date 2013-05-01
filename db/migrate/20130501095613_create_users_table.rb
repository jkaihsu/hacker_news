class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :null => false, :unique => true
      t.string :password_hash
      t.timestamps
    end
  end
end
