FactoryBot.define do
  factory :item do
    name          {"商品名"}
    description    {"商品の説明"}
    price           {2000}
    product_condition_id        {2}
    shipping_charges_id         {2}
    shipping_area_id            {2}
    days_to_ship_id             {2}
    category_id                 {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
