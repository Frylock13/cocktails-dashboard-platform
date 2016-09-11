class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.order('name').page(params[:page])
  end

  def show
    find_ingredient
    @recipes = @ingredient.recipes
  end

  def destroy
    find_ingredient
    authorize @ingredient
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def find_ingredient
    @ingredient = Ingredient.friendly.find(params[:id])
  end
end
