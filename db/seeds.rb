# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      review = Review.create!(
        content: Faker::Fantasy::Tolkien.poem,
        author: Faker::Fantasy::Tolkien.character,
        rating: rand(1..5),
        landmark: Faker::Fantasy::Tolkien.location,
        city: Faker::Address.city,
        country: Faker::Address.country,
        user_name: Faker::DcComics.heroine
      )
      puts "Review #{i}: Location is #{review.landmark}, city is #{review.city}, and country is #{review.country}. Review author is #{review.author}, rating is #{review.rating}, content is #{review.content}, username is #{review.user_name}"
    end
  end
end

Seed.begin