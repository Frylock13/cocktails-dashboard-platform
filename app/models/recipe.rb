class Recipe < ApplicationRecord

  validates :chef_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :summary, presence: true, length: { minimum: 30, maximum: 300 }
  validates :description, presence: true, length: { minimum: 300 }

  belongs_to :chef
end
