FactoryBot.define do
  factory :purchase_record_destination do
    postal_code              { '123-4567' }
    shipping_area_id         {2}
    municipality             { '横浜市緑区' }
    address            { '青山1-1-1' }
    building_name        { '' }
    phone_number       { '09012345678' }
    token              { 'xTpI/KhEvh3Z9VbNyd1I0y5/sV5u0fW9kmX7yEso7s6trkhlYvNftSmGogwYKiGME9IhwQTN7vvzp4Hp4JcqkA==' }
  end
end