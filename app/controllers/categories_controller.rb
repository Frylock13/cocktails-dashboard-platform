class CategoriesController < ApplicationController

  def index
    @categories = Category.order("name")
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def edit
  end

  def update
  end
end
