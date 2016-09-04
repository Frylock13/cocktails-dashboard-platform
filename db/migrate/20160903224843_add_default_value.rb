class AddDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :categories, :recipes_count, :integer, default: 0
  end
end
