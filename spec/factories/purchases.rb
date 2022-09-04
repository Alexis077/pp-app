FactoryBot.define do
  factory :purchase do
    client { create(:client) }
    total_products { 1 }
    total_amount { "9.99" }
    date { "2022-09-03 20:01:52" }
  end
end
