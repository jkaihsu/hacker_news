class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts, :class_name => "Post", :foreign_key => "author_id"
  has_many :comments, :class_name => "Comment", :foreign_key => "author_id"

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :uniqueness => true, :presence => true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.login(params)
    @user = User.find_by_email(params[:email])
    return false if @user == nil
    @user.password == params[:password]
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
