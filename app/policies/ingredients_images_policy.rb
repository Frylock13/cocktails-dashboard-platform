class IngredientsImagesPolicy
  attr_reader :user, :images

  def initialize(user, post)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @images = images
  end

  def destroy?
    user.admin?
  end
end