class Review < ApplicationRecord
  validates :landmark, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  before_save(:titleize_country)
  before_save(:titleize_landmark)
  before_save(:titleize_city)
  scope :city_search, -> (city_parameter) { where(city: city_parameter) }
  # scope :country_search, -> (country_parameter) { where(country: country_parameter) }
  scope :country_search, -> (country_parameter) {where("country like ?", "%#{country_parameter}%")}
  scope :most_reviews {}
  scope :best_rating {where(rating:5)}



  private
    def titleize_product
      self.name = self.name.titleize
    end
end
