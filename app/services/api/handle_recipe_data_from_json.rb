module API
  class HandleRecipeDataFromJson

    attr_reader :id
    attr_reader :json

    def initialize(id)
      @id = id
    end

    def call
      json = get_json
      return unless json

      return_prepared_recipe_object
    end

    def get_json
      encoded_url = URI.encode("http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}")
      json = HTTParty.get(encoded_url)
      json['drinks']
    end

    def return_prepared_recipe_object
      recipe = Recipe.new
      recipe.name = handle_name
    end

    private

    def handle_name
      name = json['drinks'].first['strDrink']
      name ? name : ''
    end
  end
end