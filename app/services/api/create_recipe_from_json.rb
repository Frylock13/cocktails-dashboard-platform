module API
  class CreateRecipeFromJson

    attr_reader :id
    attr_reader :json

    def initialize(id)
      @id = id
    end

    def call
      @json = get_json
      return unless json

      recipe = create_recipe
      create_ingredient_associations(recipe.id)
      recipe
    end

    def get_json
      encoded_url = URI.encode("http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}")
      json = HTTParty.get(encoded_url)
      json['drinks'].first if json['drinks']
    end

    def create_recipe
      recipe = Recipe.new

      recipe.name = get_name
      recipe.description = get_description
      recipe.category_id = get_category_id
      recipe.type = get_type
      recipe.glass_id = get_glass_id
      recipe.image = get_image

      recipe.save
      recipe
    end

    private

    def get_name
      json['strDrink']
    end

    def get_description
      json['strInstructions']
    end

    def get_category_id
      category_name = json['strCategory']
      category = Category.find_by(name: category_name)

      if category
        category.id
      else
        Category.find_by(name: 'Other').id
      end
    end

    def get_type
      json['strAlcoholic']
    end

    def get_glass_id
      glass_name = json['strGlass']
      glass = Glass.find_by(name: glass_name)

      if glass
        glass.id
      else
        Glass.find_by(name: 'Unknown glass type').id
      end
    end

    def get_image
      image_url = json['strDrinkThumb']
      image_url unless image_url.empty?
    end

    def create_ingredient_associations(recipe_id)
      api = API::CreateIngredientsAssociationsFromJson.new(json, recipe_id)
      api.call
    end
  end
end