FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email    { Faker::Internet.free_email }
    password { 'aaaa1234' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { 'ひろ士' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'ヒロシ' }
    birthday { '2000-01-01' }

  end
end
