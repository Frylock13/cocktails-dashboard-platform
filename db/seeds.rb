# Destroy all
Recipe.destroy_all
Chef.destroy_all

# Generate fake data
5.times do
  Chef.create!(name: Faker::Name.name, email: Faker::Internet.email)
end

5.times do
  Recipe.create!(name: Faker::Lorem.word, summary: Faker::Lorem.paragraph, description: Faker::Lorem.paragraph(15),
                 chef_id: Chef.first.id)
end