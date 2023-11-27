FactoryBot.define do
  factory :user do
    nickname               {'test'}
    email                  { Faker::Internet.unique.email }
    password               {'aaa111'}
    password_confirmation  {password}
    lastname_kanji         {'てすと'}
    firstname_kanji        {'てすと'}
    lastname_kana          {'テスト'}
    firstname_kana         {'テスト'}
    birthday               { Date.new(1996,11,28) }
  end
end