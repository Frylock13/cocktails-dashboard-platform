class Ingredient < ApplicationRecord

  include Imagable

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_attached_file :image, styles: { thumb: "64x64>" }, default_url: "missings/ingredient.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  paginates_per 30

  before_create do
    upload_an_image
  end
end
