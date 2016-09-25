class Categories::ImagesController < ApplicationController

  def index
    find_category
    search = Api::ImagesSearch.new(@category.name)
    @images = search.call
  end

  def update
    find_category
    @category.image = params['image_url']
    @category.save
    redirect_to @category
  end

  private

  def find_category
    @category = Category.friendly.find(params[:category_id])
  end
end
