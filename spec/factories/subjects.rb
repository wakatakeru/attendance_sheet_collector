require 'faker'

FactoryBot.define do
  factory :subject do
    name 'TestExpr1'
    display_name { Faker::Name.name }
    term '2099'
    url 'http://example.com'
  end
end
