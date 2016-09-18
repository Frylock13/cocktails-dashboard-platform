class AddColumnDoseToRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :recipe_ingredients, :dose, :string
  end
end
