class AddColumnIngredientsListToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :ingredients_listss, :string
  end
end
