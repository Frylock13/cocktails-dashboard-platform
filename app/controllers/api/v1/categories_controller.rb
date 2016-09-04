class Api::V1::CategoriesController < ApplicationController

  respond_to :json

  def index
    categories = Category.all
    respond_with categories
  end

  def show
    category = Category.friendly.find(params[:id])
    respond_with category
  end
end
