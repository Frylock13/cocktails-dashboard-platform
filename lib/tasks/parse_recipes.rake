namespace :parse do
  desc "Import movie list"
  task recipes: :environment do

    agent = Mechanize.new
    base_url = "http://www.webtender.com/db/drink/"

    current_index = 1
    last_correct_index = 0

    while true do   
      url = base_url + current_index.to_s

      begin   
        page = agent.get(url)

        last_correct_index = current_index
        current_index += 1
        puts "Last existing id is #{last_correct_index}".blue

        parse_page_to_create_recipe(page)
      rescue Mechanize::ResponseCodeError
        puts "Last existing id is #{last_correct_index}. There is no #{current_index} id.".red
        current_index += 1
        next    
      end   

      sleep 1
    end   
  end   
    
  private   
    
  def parse_page_to_create_recipe(page)
    recipe = Recipe.new
    recipe.name = perform_recipe_name(page)
    recipe.save!
    puts "#{recipe.name} has created!".green
  end

  def perform_recipe_name(page)
    name = page.search('h1').text
    name ? name : ''
  end
end