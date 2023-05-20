FactoryBot.define do
  factory :order_shipping do
    postcode      { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Gimei.city.kanji}
    address       { Gimei.town.kanji}
    building      { Faker::Address.building_number}
    phone_number  { '1234567890' }
    token         {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end
