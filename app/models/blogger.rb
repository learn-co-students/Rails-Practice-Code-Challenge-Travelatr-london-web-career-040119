class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  # Bloggers should have unique names and ages above 0, and their bio should be over 30 characters long
  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, presence: true, length: { minimum: 30 }

  def total_likes
    self.posts.map { |p| p.likes }.sum
  end

  def featured_posts
    Post.where("blogger_id = ?", self.id).order(likes: :desc).limit(5)
  end

end
