class Ingredient < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
