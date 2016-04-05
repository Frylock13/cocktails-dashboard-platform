class Review < ApplicationRecord

  belongs_to :chef, counter_cache: true
  belongs_to :recipe

  validates :text, presence: true, length: { minimum: 30, maximum: 1000 }
end
