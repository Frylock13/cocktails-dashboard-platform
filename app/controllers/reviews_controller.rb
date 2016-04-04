class ReviewsController < ApplicationController

  def new
    @review = current_user.chef.reviews.new
  end

  def create
    @review = current_user.chef.reviews.new(review_params)

    if @review.save
      redirect_to recipe_path(params[:recipe_id])
      flash[:success] = 'Review has posted'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:text).merge(recipe_id: params[:recipe_id])
  end
end
