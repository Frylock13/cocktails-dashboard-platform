class Api::V1::RecipesController < ApplicationController

  respond_to :json

  def index
    category = Category.friendly.find(params[:category_id])
    recipes = category.recipes
    respond_with recipes
  end
end
