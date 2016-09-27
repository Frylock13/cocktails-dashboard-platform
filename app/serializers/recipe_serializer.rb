class RecipeSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description, :thumb_url

  belongs_to :category

  has_many :recipe_ingredients

  def thumb_url
    if object.image.present?
      "http:" + ActionController::Base.helpers.image_url(object.image.url)
    else
      "http://huge-it.com/wp-content/plugins/lightbox/images/No-image-found.jpg"
    end
  end
end
