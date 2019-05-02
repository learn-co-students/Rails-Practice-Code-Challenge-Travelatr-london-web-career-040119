class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    posts.order(creation_time: :desc).limit(5)
  end
end
