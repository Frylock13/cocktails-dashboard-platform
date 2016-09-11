class Ingredients::ImagesController < ApplicationController

  def index
    find_ingredient
    search = Api::ImagesSearch.new(@ingredient.name)
    @images = search.call
  end

  def update
    find_ingredient
    @ingredient.image = params['image_url']
    @ingredient.save
    redirect_to @ingredient
  end

  private

  def find_ingredient
    @ingredient = Ingredient.friendly.find(params[:ingredient_id])
  end
end
