FactoryBot.define do
  factory :purchase_item do
    purchase { nil }
    product { nil }
    quantity { 2 }
    total { 10_000 }
  end
end
