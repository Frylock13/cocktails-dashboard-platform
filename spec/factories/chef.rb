FactoryGirl.define do
  factory :chef do
    name Faker::Name.name
    email Faker::Internet.email
  end
end