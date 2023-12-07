FactoryBot.define do
  factory :purchase do
    association :purchase_record
    postal_code { "123-4567" }
    shipping_area_id { 2 }
    city { "テスト" }
    street { "テスト1-1-1" }
    building_name { "テスト101" }
    phone_number { "12345678901" }
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
    token { "valid_token" }
  end
end