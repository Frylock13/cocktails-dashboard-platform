namespace :seed do
  desc "Seed ingredients"
  task ingredients: :environment do

  Glass.destroy_all

  seed_file = Rails.root.join('db', 'seeds', 'glasses.yml')
  config = YAML::load_file(seed_file)

  # executing before_create callback which helps to find an image
  Glass.create!(config)
  end
end