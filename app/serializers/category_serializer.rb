class CategorySerializer < ActiveModel::Serializer
  
  attributes :name, :recipes_count
end
