Recipe.destroy_all
User.destroy_all
RecipeIngredient.destroy_all

# Generate a fake data
5.times do
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  recipe = Recipe.create!(name: Faker::Lorem.word, description: Faker::Lorem.paragraph(15),
                          chef_id: user.id, image: Faker::Avatar.image, category_id: Category.first.id)
end