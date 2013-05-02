class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, :null => true
      t.references :user
      t.references :post      
      t.timestamps
    end
    add_index :comments, [:user_id, :post_id]
  end
end
