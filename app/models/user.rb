class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts, :class_name => "Post", :foreign_key => "author_id"
  has_many :comments, :class_name => "Comment", :foreign_key => "author_id"

  validates :email, :uniqueness => true, :presence => false

  def full_name
    self.first_name + " " + self.last_name
  end

  # bcrypt
end
