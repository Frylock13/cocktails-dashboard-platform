class CreateRecipeStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_styles do |t|
      t.references :style, foreign_key: true
      t.references :recipe, foreign_key: true
    end
  end
end
