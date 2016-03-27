# Destroy all
Recipe.destroy_all
Chef.destroy_all

# Generate fake data
5.times do 
  User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
end

5.times do |count|
  Chef.create!(name: Faker::Name.name, avatar: Faker::Avatar.image, user_id: count+1)
end

5.times do
  Recipe.create!(name: Faker::Lorem.word, summary: Faker::Lorem.paragraph, description: Faker::Lorem.paragraph(15),
                 chef_id: Chef.order('RANDOM()').first.id, image: Faker::Avatar.image)
end