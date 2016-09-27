class RecipeIngredientSerializer < ActiveModel::Serializer
  
  attributes :id, :ingredient

  belongs_to :ingredient
end
