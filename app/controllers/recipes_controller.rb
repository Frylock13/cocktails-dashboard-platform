class RecipesController < ApplicationController

  before_action :set_editable_recipe, only: [:edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.includes(:chef).order('id DESC').page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id]).decorate
    @reviews = @recipe.reviews.includes(:chef).decorate
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

  def like
    like = RecipeLikeService.new(params[:recipe_id], current_user.chef.id)

    if like.call
      redirect_back(fallback_location: recipes_path)
      flash[:success] = 'You have liked this recipe'
    else
      redirect_back(fallback_location: recipes_path)
      flash[:danger] = 'You already have liked this recipe'
    end
  end

  def dislike
    like = RecipeDislikeService.new(params[:recipe_id], current_user.chef.id)

    if like.call
      redirect_back(fallback_location: recipes_path)
      flash[:success] = 'You have disliked this recipe'
    else
      redirect_back(fallback_location: recipes_path)
      flash[:danger] = 'You already have disliked this recipe'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :image, style_ids: [], ingredient_ids: [])
  end

  def set_editable_recipe
    if current_user.admin? || owner?(params[:id])
      @recipe = Recipe.find(params[:id]).decorate
    end
  end

  def owner?(recipe_id)
    current_user.chef.recipes.ids.include?(recipe_id)
  end
end