class ProfilesController < ApplicationController

  before_action :set_profile

  def show
    @recipes_count = @profile.recipes.count
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
