class ReviewDecorator < Draper::Decorator
  delegate_all

  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers

  def posted_by
    "Posted by: #{time_ago_in_words(object.created_at)} ago"
  end

  def check_permissions_for_edit_action(user, recipe_id)
    if admin?(user) || owner?(user)
      h.link_to 'Edit', edit_recipe_review_path(recipe_id: recipe_id, id: object.id), class: 'btn btn-warning'
    end
  end

  def check_permissions_for_destroy_action(user, recipe_id)
    if admin?(user) || owner?(user)
      h.link_to 'Delete', recipe_review_path(recipe_id: recipe_id, id: object.id), method: :delete, class: 'btn btn-danger', data: {confirm: "Are you sure?"}
    end
  end

  private

  def owner?(user)
    object.chef_id == user.chef.id
  end

  def admin?(user)
    user.admin?
  end
end
