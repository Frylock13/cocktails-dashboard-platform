class CreateDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :dislikes do |t|
      t.references :chef, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
