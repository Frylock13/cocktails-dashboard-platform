class StylesController < ApplicationController

  def index
    @styles = Style.order('name')
  end

  def show
    @style = Style.friendly.find(params[:id])
    @recipes = @style.recipes
  end
end
