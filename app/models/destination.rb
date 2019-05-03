class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    Post.where("destination_id = ?", self.id).order(creation_time: :desc).limit(5)
  end

  def unique_bloggers
    self.bloggers.uniq
  end

  def average_bloggers_age
    ages = unique_bloggers.map {|b| b.age }
    ages.sum / ages.count
  end

  def featured_posts
    Post.where("destination_id = ?", self.id).order(likes: :desc).limit(5)
  end

end
