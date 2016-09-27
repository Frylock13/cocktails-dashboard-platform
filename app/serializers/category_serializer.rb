class CategorySerializer < ActiveModel::Serializer
  
  attributes :id, :name, :recipes_count, :description, :slug, :thumb_url

  def thumb_url
    if object.image.present?
  	  "http:" + ActionController::Base.helpers.image_url(object.image.url)
    else
      "http://huge-it.com/wp-content/plugins/lightbox/images/No-image-found.jpg"
    end
  end
end
