FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    surname               { '山田' }
    surname_kana          { 'ヤマダ'}
    name                  { '太郎'}
    name_kana             { 'タロウ'}
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end

# FactoryBot.define do
#   factory :user do
#     nickname              { Faker::Name.initials(number: 2) }
#     email                 { Faker::Internet.email }
#     password              { Faker::Internet.password(min_length: 6) }
#     password_confirmation { password }
#     surname               { Faker::Name.last_name }
#     surname_kana          { Faker::Japanese::Name.last_name_yomi }
#     name                  { Faker::Name.first_name }
#     name_kana             { Faker::Japanese::Name.first_name_yomi }
#     date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) }
#   end
# end