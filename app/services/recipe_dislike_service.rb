class RecipeDislikeService

  def initialize(recipe_id, chef_id)
    @recipe_id = recipe_id
    @chef_id = chef_id
    @dislike = Dislike.new(recipe_id: recipe_id, chef_id: chef_id)
  end

  def call
    if @dislike.valid?
      @dislike.save
      destroy_like_if_exists
    else
      false
    end
  end

  private

  def destroy_like_if_exists
    like = Like.where(recipe_id: @recipe_id, chef_id: @chef_id).take
    like.destroy if like.present?
  end
end