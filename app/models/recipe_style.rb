class RecipeStyle < ApplicationRecord

  belongs_to :style
  belongs_to :recipe
end
