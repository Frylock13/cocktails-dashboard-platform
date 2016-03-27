class RecipeLikeService

  def initialize(recipe_id, chef_id)
    @recipe_id = recipe_id
    @chef_id = chef_id
    @like = Like.new(recipe_id: recipe_id, chef_id: chef_id)
  end

  def call
    if @like.valid?
      @like.save
      destroy_dislike_if_exists
      true
    else
      false
    end
  end

  private

  def destroy_dislike_if_exists
    dislike = Dislike.where(recipe_id: @recipe_id, chef_id: @chef_id).take
    dislike.destroy if dislike.present?
  end
end