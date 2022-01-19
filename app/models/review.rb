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
  scope :best_rating, -> {where(rating: 5)}
  scope :country_search, -> (country_parameter) {where("country ilike ?", "%#{country_parameter}%")}  

  scope :ten_most_recent, -> { order(created_at: :desc).limit(10)}

  def self.most_reviews
    arr = []
    Review.all.each do |review|
      arr.push(review["landmark"])
    end
    most_reviews_landmark = arr.max_by { |i| arr.count(i) }
    where(landmark: most_reviews_landmark)
  end

  private  
    def titleize_country
      self.country = self.country.titleize
    end
    
    def titleize_landmark
      self.landmark = self.landmark.titleize
    end
    
    def titleize_city
      self.city = self.city.titleize
    end
end