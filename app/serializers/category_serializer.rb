class CategorySerializer < ActiveModel::Serializer
  
  attributes :name, :recipes_count, :description, :slug
end
