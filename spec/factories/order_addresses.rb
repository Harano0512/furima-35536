FactoryBot.define do
  factory :order_address do
    token {'tok_abcdefghijk00000000000000000'} 
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'テスト市'}
    house_number {'テスト町1-1-1'}
    building_name {'テスト101号室'}
    phone_number {'09012345678'}
    order_id {1}
    user_id {1}
    item_id {1}
  end
end
