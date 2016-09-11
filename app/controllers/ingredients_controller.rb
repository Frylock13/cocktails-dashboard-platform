class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.order('name').page(params[:page])
  end
end
