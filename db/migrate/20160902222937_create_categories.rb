class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :recipes_count, default: 0
      t.text :description
    end
  end
end
