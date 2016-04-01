class Dislike < ApplicationRecord

  belongs_to :chef, counter_cache: true
  belongs_to :recipe, counter_cache: true

  validates :recipe_id, uniqueness: { scope: :chef_id }
end
