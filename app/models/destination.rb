class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    posts.order(creation_time: :desc).limit(5)
  end

  def unique_bloggers
    self.users.uniq
  end

  def average_bloggers_age
    ages = unique_bloggers.map {|b| b.age }
    ages.sum / ages.count
  end
  
end
