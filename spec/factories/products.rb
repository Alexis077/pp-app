FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 0..200.0, as_string: false) }
    available_units { 100 }
  end
end
