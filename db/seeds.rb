# Destroy all
Recipe.destroy_all
User.destroy_all
Chef.destroy_all

# Generate fake data
5.times do 
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  Recipe.create!(name: Faker::Lorem.word, summary: Faker::Lorem.paragraph, description: Faker::Lorem.paragraph(15),
                 chef_id: user.id, image: Faker::Avatar.image)
end
