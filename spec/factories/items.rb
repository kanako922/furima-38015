FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    price {Faker::Number.number(digits: 5)}
    description{Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 1..10)}
    condition_id {Faker::Number.within(range: 1..6)}
    charge_id {Faker::Number.within(range: 1..2)}
    prefecture_id {Faker::Number.within(range: 1..47)}
    delivery_date_id {Faker::Number.within(range: 1..3)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end

  end
end
