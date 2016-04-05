class AddReviewsCountToChefs < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :reviews_count, :integer, default: 0
  end
end
