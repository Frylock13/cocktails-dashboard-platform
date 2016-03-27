class RecipeDecorator < Draper::Decorator
  delegate_all

  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers

  def posted_by
    "Posted by: #{time_ago_in_words(object.created_at)} ago"
  end

  def check_edit_action(user_id)
    if object.chef_id == user_id
      h.link_to 'Edit', edit_recipe_path(object.id), class: 'btn btn-warning'
    end
  end

  def check_destroy_action(user_id)
    if object.chef_id == user_id
      h.link_to 'Delete', recipe_path(object.id), method: :delete, class: 'btn btn-danger'
    end
  end
end
