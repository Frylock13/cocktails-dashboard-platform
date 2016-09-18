namespace :parse do
  desc "Import movie list"
  task recipes: :environment do

    current_index = 13059
    last_correct_index = 0

    while true do
      api = API::HandleRecipeDataFromJson.new(current_index)

      if api.call
        last_correct_index = current_index
        current_index += 1
        puts "Last existing id is #{last_correct_index}".blue
      else
        puts "Last existing id is #{last_correct_index}. There is no #{current_index} id.".red
        current_index += 1
        next    
      end

      sleep 1
    end   
  end   
end