class ProfilesController < ApplicationController

  before_action :set_profile
  before_action :authenticate_user!

  def show
    @recipes = current_user.chef.recipes.page(params[:page])
  end

  def edit
  end

  private

  def set_profile
    @profile = current_user.chef
  end
end
