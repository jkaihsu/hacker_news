class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validates :title, :body, :presence => true
  before_create :clean_title

  def clean_title
    self.title = title.split(" ").map { |x| x.capitalize }.join(" ")
  end

end
