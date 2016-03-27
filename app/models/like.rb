class Like < ApplicationRecord
  
  belongs_to :chef
  belongs_to :recipe

  validates :recipe_id, uniqueness: { scope: :chef_id }
end
