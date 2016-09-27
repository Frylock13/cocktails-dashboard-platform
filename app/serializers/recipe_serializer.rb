class RecipeSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description, :thumb_url, :glass_name

   has_many :ingredients

  def thumb_url
    if object.image.present?
      "http:" + ActionController::Base.helpers.image_url(object.image.url)
    else
      "http://huge-it.com/wp-content/plugins/lightbox/images/No-image-found.jpg"
    end
  end

  def glass_name
    object.glass.name
  end

  class IngredientSerializer < ActiveModel::Serializer
    attributes :name
  end
end
