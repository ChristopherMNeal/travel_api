class Review < ApplicationRecord
  validates :landmark, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end