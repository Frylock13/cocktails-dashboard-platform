class ProfilesController < ApplicationController

  before_action :set_profile

  def show
    @recipes = current_user.chef.recipes.page(params[:page])
    @likes = @profile.likes.count
    @dislikes = @profile.dislikes.count
  end

  def edit
  end

  private

  def set_profile
    @profile = current_user.chef
  end
end
