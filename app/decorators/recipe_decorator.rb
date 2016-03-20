class RecipeDecorator < Draper::Decorator
  delegate_all

  include ActionView::Helpers::DateHelper

  def posted_by
    "Posted by: #{time_ago_in_words(object.created_at)} ago"
  end
end
