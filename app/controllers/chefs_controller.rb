class ChefsController < ApplicationController

  def index
    @chefs = Chef.all.page(params[:page])
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def update
    current_user.chef.update(chef_params)
    redirect_to profile_path
    flash[:success] = 'You have updated your profile'
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :avatar)
  end
end
