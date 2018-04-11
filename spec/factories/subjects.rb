require 'faker'

FactoryBot.define do
  factory :subject do
    name { Faker::Name.name }
    display_name { Faker::Name.name }
    term '2099'
    url 'http://example.com'
    
    trait :no_name do
      name ''
    end

    trait :no_term do
      term ''
    end
  end
end
