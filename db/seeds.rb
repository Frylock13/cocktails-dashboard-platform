# Destroy all
Recipe.destroy_all
User.destroy_all
Style.destroy_all
Ingredient.destroy_all
Category.destroy_all

# Categories
seed_file = Rails.root.join('db', 'seeds', 'categories.yml')
config = YAML::load_file(seed_file)
# executing before_create callback which helps to find an image
Category.create!(config)

# Generate fake data
5.times do 
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  Recipe.create!(name: Faker::Lorem.word, summary: Faker::Lorem.paragraph, description: Faker::Lorem.paragraph(15),
                 chef_id: user.id, image: Faker::Avatar.image, category_id: Category.first.id)
end

Style.create(name: 'American', flag: File.new("#{Rails.root}/db/seeds/flag-usa.png"))
Style.create(name: 'Deutch', flag: File.new("#{Rails.root}/db/seeds/flag-deutch.png"))

# Ingredients
seed_file = Rails.root.join('db', 'seeds', 'ingredients.yml')
config = YAML::load_file(seed_file)
# executing before_create callback which helps to find an image
Ingredient.create!(config)