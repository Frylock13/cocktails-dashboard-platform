Recipe.destroy_all
User.destroy_all
RecipeIngredient.destroy_all

# Generate a fake data
User.create!(email: Faker::Internet.email, password: Faker::Internet.password, admin: true)