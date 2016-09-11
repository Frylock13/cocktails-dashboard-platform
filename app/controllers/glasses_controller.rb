class GlassesController < ApplicationController

  def index
    @glasses = Glass.order('name').page(params[:page])
  end
end
