class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :author
      t.references :post
      t.text :body, :null => true
      t.timestamps
    end
  end
end
