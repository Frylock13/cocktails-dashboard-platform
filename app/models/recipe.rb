class Recipe < ApplicationRecord

  validates :name, :summary, :description, presence: true
  validates :name, length: { maximum: 50 }
  validates :summary, length: { minimum: 30, maximum: 300 }
  validates :description, length: { minimum: 300 }
end
