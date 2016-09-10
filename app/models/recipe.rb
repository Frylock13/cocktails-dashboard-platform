class Recipe < ApplicationRecord

  include Imagable

  has_attached_file :image, styles: { large: '500x500', thumb: '100x100' }, default_url: "missings/:style/recipe.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #validates :chef_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  has_many :likes
  has_many :dislikes
  has_many :recipe_styles
  has_many :styles, through: :recipe_styles
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
  
  belongs_to :chef, counter_cache: true
  belongs_to :category, counter_cache: true

  paginates_per 5

  before_create do
    upload_an_image
  end
end
