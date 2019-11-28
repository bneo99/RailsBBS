class Post < ApplicationRecord
  paginates_per 5
  has_one_attached :image
end
