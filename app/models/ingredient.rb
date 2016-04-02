class Ingredient < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
end
