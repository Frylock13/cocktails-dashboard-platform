class GlassesController < ApplicationController

  def index
    @glasses = Glass.order('name').page(params[:page])
  end

  def destroy
    @glass = Glass.find(params[:id])
    authorize @glass
    @glass.destroy
    redirect_to glasss_path
  end
end
