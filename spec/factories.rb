FactoryBot.define do
  factory(:destination) do
    content {Faker::Fantasy::Tolkien.poem}
    author {Faker::Fantasy::Tolkien.character}
    rating {rand(1..5)}
    landmark {Faker::Fantasy::Tolkien.location}
    city {Faker::Address.city}
    country {Faker::Address.country}
  end
end
