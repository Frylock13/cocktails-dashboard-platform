class Asd < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :dislikes_count, :integer, default: 0
    change_column :chefs, :likes_count, :integer, default: 0
    change_column :chefs, :dislikes_count, :integer, default: 0
    change_column :chefs, :recipes_count, :integer, default: 0
  end
end
