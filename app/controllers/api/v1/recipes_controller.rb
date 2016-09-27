class Api::V1::RecipesController < ApplicationController

  respond_to :json

  def index
    category = Category.find(params[:category_id])
    recipes = category.recipes.includes(:ingredients).includes(:glass)
    respond_with recipes
  end
end
