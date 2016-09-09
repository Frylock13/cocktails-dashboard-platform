class RecipeSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description

  belongs_to :category

  has_many :ingredients
end
