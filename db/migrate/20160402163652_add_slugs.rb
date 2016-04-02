class AddSlugs < ActiveRecord::Migration[5.0]
  def change
    add_column :styles, :slug, :string
    add_column :ingredients, :slug, :string
  end
end
