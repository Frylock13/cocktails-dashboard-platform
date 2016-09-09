class RecipeSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :summary, :description

  belongs_to :category

  has_many :ingredients
end
