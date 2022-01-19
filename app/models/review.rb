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
  
  def self.most_reviews
    arr = []
    Review.all.each do |review|
      arr.push(review["landmark"])
    end
    most_reviews_landmark = arr.max_by { |i| arr.count(i) }
    where(landmark: most_reviews_landmark)
  end

  def self.random
    arr = []
    Review.all.each do |review|
      arr.push(review["landmark"])
    end
    set = arr.to_set
    random_num = rand(set.length)
    landmark_random = set.to_a[random_num]
    where(landmark: landmark_random)
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