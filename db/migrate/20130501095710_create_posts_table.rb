class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :link
      t.text :body
      t.references :author
      t.timestamps
    end
  end
end
