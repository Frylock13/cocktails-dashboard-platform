class IngredientPolicy
  attr_reader :user, :ingredient

  def initialize(user, post)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @post = post
  end

  def destroy?
    user.admin?
  end
end