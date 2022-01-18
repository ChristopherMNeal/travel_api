class Review < ApplicationRecord
  validates :author, presense: true
  validates :content, presense: true
  validates :rating, presense: true
end