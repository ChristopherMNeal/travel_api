FactoryBot.define do
  factory(:review) do
    content {Faker::Fantasy::Tolkien.poem}
    author {Faker::Fantasy::Tolkien.character}
    rating {rand(1..5)}
    landmark {Faker::Fantasy::Tolkien.location}
    city {Faker::Address.city}
    country {Faker::Address.country}
    user_name {'Morgan'}
  end
end
