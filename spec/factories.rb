FactoryBot.define do
  factory(:destination) do
    name {Faker::Fantasy::Tolkien.location}
    city {Faker::Address.city}
    country {Faker::Address.country}
  end
end
