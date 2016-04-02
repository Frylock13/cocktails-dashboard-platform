class Style < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  
  has_many :recipe_styles
  has_many :recipes, through: :recipe_styles
end
