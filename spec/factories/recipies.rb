FactoryGirl.define do
  factory :recipe do
    name Faker::Lorem.word
    summary Faker::Lorem.paragraph
    description Faker::Lorem.paragraph(15)
    chef_id 1
  end
end