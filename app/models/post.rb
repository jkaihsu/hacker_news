class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
end
