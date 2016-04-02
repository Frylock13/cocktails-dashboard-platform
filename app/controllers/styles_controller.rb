class StylesController < ApplicationController

  def index
    @styles = Style.all
  end

  def show
    @style = Style.friendly.find(params[:id])
    @recipes = @style.recipes
  end
end
