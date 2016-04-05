class PagesController < ApplicationController
  
  def home
    @recipes = Recipe.order('id DESC').limit(5)
    @chefs = Chef.order('id DESC').limit(5)
    @reviews = Review.order('id DESC').limit(5)
  end
end
