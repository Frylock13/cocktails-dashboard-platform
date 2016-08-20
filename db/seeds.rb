
# Ingredients
Ingredient.destroy_all
seed_file = Rails.root.join('db', 'seeds', 'ingredients.yml')
config = YAML::load_file(seed_file)
Ingredient.create!(config)