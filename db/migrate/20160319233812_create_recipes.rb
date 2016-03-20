class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.references :chef, index: true, foreign_key: true

      t.timestamps
    end
  end
end
