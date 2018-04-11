require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    st_num 's00t000'
    role :student
    email { Faker::Internet.email }
    password 'hogehoge'
    password_confirmation 'hogehoge'
    
    trait :teacher do
      st_num 'teacher'
      role :teacher
    end
  end
end
