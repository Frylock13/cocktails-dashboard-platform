namespace :seed do
  desc "Seed glasses"
  task glasses: :environment do

    Glass.delete_all

    seed_file = Rails.root.join('db', 'seeds', 'ymls', 'glasses.yml')
    config = YAML::load_file(seed_file)

    # executing before_create callback which helps to find an image
    Glass.create!(config)
  end
end