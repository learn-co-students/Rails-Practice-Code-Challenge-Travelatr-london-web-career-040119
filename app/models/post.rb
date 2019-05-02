class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  accepts_nested_attributes_for :blogger
  accepts_nested_attributes_for :destination

  # must have title
  validates :title, presence: true
  # content longer than 100 characters
  validates :content, presence: true
  validates :creation_time, presence: true
end
