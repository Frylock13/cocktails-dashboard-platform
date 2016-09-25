class ImagesController < ApplicationController

  def index
    find_object
    search = Api::ImagesSearch.new(@object.name)
    @images = search.call
  end

  def update
    find_object
    @object.update(image: params[:image_url])
    redirect_back(fallback_location: root_path)
  end

  private

  def find_object
    model = params[:type].constantize
    object_ID = params[:id] || params[:ingredient_id] || params[:glass_id] || params[:category_id]
    @object = model.find(object_ID)
  end
end
