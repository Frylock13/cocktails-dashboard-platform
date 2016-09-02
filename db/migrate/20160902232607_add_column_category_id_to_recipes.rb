class AddColumnCategoryIdToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :category_id, :integer
    add_index :recipes, :category_id
  end
end
