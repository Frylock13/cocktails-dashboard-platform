class RecipeIngredient < ApplicationRecord

  belongs_to :recipe, counter_cache: true
  belongs_to :ingredient
end
