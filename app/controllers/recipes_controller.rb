class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.includes(:chef).decorate
  end

  def show
  end

  def new
    @recipe = current_user.chef.recipes.new
  end

  def create
    @recipe = current_user.chef.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path
      flash[:success] = 'Recipe created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(params[:id])
      flash[:success] = 'Updated'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
    flash[:success] = 'You have deleted recipe'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id]).decorate
  end
end