Recipe.destroy_all
User.destroy_all
Category.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all

Category.create(name: 'Category 1')
Ingredient.create(name: 'Ingredient 1', image: File.new("#{Rails.root}/db/seeds/styles/flag-usa.png"))

# Generate a fake data
5.times do
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  recipe = Recipe.create!(name: Faker::Lorem.word, description: Faker::Lorem.paragraph(15),
                          chef_id: user.id, image: Faker::Avatar.image, category_id: Category.first.id)
  RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: Ingredient.first.id)
end