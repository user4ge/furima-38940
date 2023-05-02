FactoryBot.define do
  factory :user do
    nickname              {Gimei.first.hiragana}
    email                 {Faker::Internet.free_email}
    # password: Default configuration is mix_case: true && special_characters: false
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    ruby_last_name        {Gimei.last.katakana}
    ruby_first_name       {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: -5.year.from_now)}
  end
end
