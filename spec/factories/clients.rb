FactoryBot.define do
  factory :client do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 100) }
    gender { Faker::Gender.binary_type }
    address { Faker::Address.street_address }
  end
end
