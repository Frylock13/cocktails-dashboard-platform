namespace :seed do
  desc "Import movie list"
  task recipes: :environment do

    current_index = 13059
    last_correct_index = 0

    while true do
      api = API::CreateRecipeFromJson.new(current_index)
      recipe = api.call

      if recipe
        last_correct_index = current_index
        current_index += 1
        puts "Recipe #{recipe.id} has been created. Last existing remote id is #{last_correct_index}.".green
      else
        puts "Last existing remote id is #{last_correct_index}. There is no #{current_index} id.".red
        current_index += 1
        next    
      end

      sleep 1
    end   
  end   
end