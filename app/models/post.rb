class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  # must have title
  validates :title, presence: true
  # content longer than 100 characters
  validates :content, presence: true
end
