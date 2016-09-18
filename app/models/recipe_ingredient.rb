class RecipeIngredient < ApplicationRecord

  belongs_to :recipe
  belongs_to :ingredient, counter_cache: :recipes_count
end
