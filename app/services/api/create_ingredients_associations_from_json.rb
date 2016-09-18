module API
  class CreateIngredientsAssociationsFromJson

    attr_reader :json
    attr_reader :recipe_id

    def initialize(json, recipe_id)
      @json = json
      @recipe_id = recipe_id
    end

    def call
      # API looks like:
      # strIngredient1 .. strIngredient15 for ingredient names
      # strMeasure1 .. strMeasure15 for a doze for each ingredient
      15.times do |index|
        ingredient_name = json["strIngredient#{index + 1}"]
        ingredient_id = get_ingredient_id_by_name(ingredient_name)

        if ingredient_name != '' && ingredient_id
          RecipeIngredient.create(recipe_id: recipe_id, ingredient_id: ingredient_id)
        else
          next
        end
      end
    end

    private

    def get_ingredient_id_by_name(name)
      ingredient = Ingredient.find_by(name: name)
      ingredient.id if ingredient
    end
  end
end