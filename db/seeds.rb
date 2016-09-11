
# Glasses
seed_file = Rails.root.join('db', 'seeds', 'glasses.yml')
config = YAML::load_file(seed_file)
# executing before_create callback which helps to find an image
Glass.create!(config)
