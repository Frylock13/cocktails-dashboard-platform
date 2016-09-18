class RemoveColumnSummaryFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :summary
  end
end
