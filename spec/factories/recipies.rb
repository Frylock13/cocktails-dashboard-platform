FactoryGirl.define do
  factory :recipe do
    name Faker::Lorem.word
    summary Faker::Lorem.paragraph
    description Faker::Lorem.paragraph(15)
  end
end