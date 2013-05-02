class PostVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :user_id, :post_id 
end
