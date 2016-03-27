class RecipeDecorator < Draper::Decorator
  delegate_all

  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers

  def posted_by
    "Posted by: #{time_ago_in_words(object.created_at)} ago"
  end

  def check_edit_action(user)
    if object.chef_id == user.chef.id
      h.link_to 'Edit', edit_recipe_path(object.id), class: 'btn btn-warning'
    end
  end

  def check_destroy_action(user)
    if object.chef_id == user.chef.id
      h.link_to 'Delete', recipe_path(object.id), method: :delete, class: 'btn btn-danger', data: {confirm: "Are you sure?"}
    end
  end

  def likes_count
    "(#{object.likes.count})"
  end

  def dislikes_count
    "(#{object.dislikes.count})"
  end
end
