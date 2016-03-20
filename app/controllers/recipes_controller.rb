class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :destroy]

  def index
    @recipes = Recipe.includes(:chef)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
  end

  def edit
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end