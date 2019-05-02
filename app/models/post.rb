class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  # must have title

  # content longer than 100 characters
  
end
