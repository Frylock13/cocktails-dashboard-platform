class CategorySerializer < ActiveModel::Serializer
  
  attributes :id, :name, :recipes_count, :description, :slug, :thumb_url

  def thumb_url
  	"http:" + ActionController::Base.helpers.image_url(object.image.url)
  end
end
