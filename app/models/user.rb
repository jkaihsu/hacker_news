class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :posts
  has_many :post_votes

  validates :first_name, :last_name, :email, :presence => true
  
  VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

  validate :password_length

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # def self.login(params)
  #   @user = User.find_by_email(params[:email])
  #   return false if @user == nil
  #   @user.password == params[:password]
  # end

  def authenticate(email, password)
    user = User.find_by_email(email)
    user && user.password == password
  end

  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def password_length
    # puts "-----------------------"
    # puts password.inspect
    # puts "-----------------------"
    unless password.length > 6
      errors.add(:password, "Password is WEAKSAUCE")
    end
  end

end
