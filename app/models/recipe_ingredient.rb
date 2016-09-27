class RecipeIngredient < ApplicationRecord

  before_create :add_ingredient_to_ingredients_list

  belongs_to :recipe
  belongs_to :ingredient, counter_cache: :recipes_count

  def add_ingredient_to_ingredients_list
    #self.
  end
end
