class AddLikesCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :likes_count, :integer
    add_column :recipes, :dislikes_count, :integer
    add_column :chefs, :likes_count, :integer
    add_column :chefs, :dislikes_count, :integer
    add_column :chefs, :recipes_count, :integer
  end
end
