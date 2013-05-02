class CommentVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :comment
  belongs_to :user

  validates_uniqueness_of :user_id, :comment_id 
end
