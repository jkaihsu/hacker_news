class CreateCommentVotesTable < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :comment
      t.references :user
      t.timestamps
    end
    add_index :comment_votes, [:comment_id, :user_id]
  end
end
