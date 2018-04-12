require 'faker'

FactoryBot.define do
  factory :attendance_sheet do
    user
    lesson
    comment Faker::Matz.quote
    summary Faker::Matz.quote
  end
end
