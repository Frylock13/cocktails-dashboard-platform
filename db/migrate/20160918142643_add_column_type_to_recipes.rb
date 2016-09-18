class AddColumnTypeToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :type, :string
  end
end
