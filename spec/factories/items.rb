FactoryBot.define do
  factory :item do
    product_name               {'test'}
    product_description        {'test'}
    category_id                {2}
    item_condition_id          {2}
    shipping_fee_id            {2}
    shipping_area_id           {2}
    estimated_shipping_date_id {2}
    price                      {'1000'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
