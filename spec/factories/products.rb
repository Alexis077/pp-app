FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Number.within(range: 100..20_000) }
    available_units { 100 }
  end
end
