FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.email }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday { '2010-01-01' }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
