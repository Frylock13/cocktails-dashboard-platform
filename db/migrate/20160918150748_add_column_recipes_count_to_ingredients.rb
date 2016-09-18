class AddColumnRecipesCountToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :recipes_count, :integer
  end
end
