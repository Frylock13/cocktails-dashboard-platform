class CreateChefs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
