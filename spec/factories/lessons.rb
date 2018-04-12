require 'faker'

FactoryBot.define do
  factory :lesson do
    subject
    week Faker::Number.between(2000, 2099)
  end
end
