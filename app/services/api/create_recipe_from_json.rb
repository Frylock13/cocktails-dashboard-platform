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

      return_prepared_recipe_object
    end

    def get_json
      encoded_url = URI.encode("http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}")
      json = HTTParty.get(encoded_url)
      json['drinks'].first if json['drinks']
    end

    def return_prepared_recipe_object
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
      name = json['strDrink']
      name
    end

    def get_description
      description = json['strInstructions']
      description
    end

    def get_category_id
      category_name = json['strCategory']
      category = Category.find_by(name: category_name)
      category ? category.id : nil
    end

    def get_type
      type = json['strAlcoholic']
      type
    end

    def get_glass_id
      glass_name = json['strGlass']
      glass = Glass.find_by(name: glass_name)
      
      if glass
        glass.id
      else
        Glass.find_by(name: 'Other').id
      end
    end

    def get_image
      image_url = json['strDrinkThumb']
      image_url unless image_url.empty?
    end
  end
end