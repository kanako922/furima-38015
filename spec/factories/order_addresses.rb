FactoryBot.define do
  factory :order_address do
    user_id { 1 }
    item_id { 1 }
    zip_code { '123-4567' }
    prefecture_id { 1 }
    city { '大阪市' }
    address_line { '1-1-1' }
    building { 'あああ' }
    tel { '08012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
