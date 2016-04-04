class ReviewsController < ApplicationController

  before_action :set_recipe, only: [:new, :create, :edit, :update]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = current_user.chef.reviews.new
  end

  def create
    @review = @recipe.reviews.new(review_params)

    if @review.save
      redirect_to recipe_path(params[:recipe_id])
      flash[:success] = 'Review has posted'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(text: params[:review][:text])
      redirect_to recipe_path(params[:recipe_id])
      flash[:success] = 'Review has updated'
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_back(fallback_location: recipes_path)
      flash[:success] = 'Review has destroyed'
    else
      redirect_back(fallback_location: recipes_path)
      flash[:danger] = 'Something went wrong'
    end
  end

  private

  def set_review
    if current_user.admin? || owner?(params[:id])
      @review = Review.find(params[:id])
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def review_params
    params.require(:review).permit(:text).merge(chef_id: current_user.chef.id)
  end

  def owner?(recipe_id)
    current_user.chef.recipes.ids.include?(recipe_id)
  end
end
