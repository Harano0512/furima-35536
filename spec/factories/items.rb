FactoryBot.define do
  factory :item do
    item_name { '缶チューハイ' }
    text { 'テストテストテストテストテストテストテストテストテスト' }
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end
  end
end
