class RecipeSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description, :thumb_url

  belongs_to :category

  has_many :recipe_ingredients

  def thumb_url
    "http:" + ActionController::Base.helpers.image_url(object.image.url)
  end
end
