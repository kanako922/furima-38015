FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name {Gimei.last.kanji}
    first_name {Gimei.first.kanji}
    last_name_kana {Gimei.last.katakana}
    first_name_kana {Gimei.first.katakana}
    birthday {Faker::Date.birthday}
  end
end