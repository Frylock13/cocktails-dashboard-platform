namespace :seed do
  desc "Seed categories"
  task categories: :environment do

    Category.delete_all

    seed_file = Rails.root.join('db', 'seeds', 'ymls', 'categories.yml')
    config = YAML::load_file(seed_file)
    
    # executing before_create callback which helps to find an image
    Category.create!(config)
  end
end