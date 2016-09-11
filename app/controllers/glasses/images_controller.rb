class Glasses::ImagesController < ApplicationController

  def index
    find_glass
    search = Api::ImagesSearch.new(@glass.name)
    @images = search.call
  end

  def update
    find_glass
    @glass.image = params['image_url']
    @glass.save
    redirect_to glasses_path
  end

  private

  def find_glass
    @glass = Glass.find(params[:glass_id])
  end
end
