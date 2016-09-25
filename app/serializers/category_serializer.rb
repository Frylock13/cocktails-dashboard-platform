class CategorySerializer < ActiveModel::Serializer
  
  attributes :name, :recipes_count, :description, :slug, :thumb_url

  def thumb_url
  	ActionController::Base.helpers.image_url(object.image.url(:thumb))
  end
end
