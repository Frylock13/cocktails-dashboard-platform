class Recipe < ApplicationRecord

  has_attached_file :image, styles: { large: '500x500', thumb: '100x100' }, default_url: "missings/:style/recipe.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :chef_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  #validates :summary, presence: true, length: { minimum: 30, maximum: 300 }
  #validates :description, presence: true, length: { minimum: 100 }

  has_many :likes
  has_many :dislikes
  has_many :recipe_styles
  has_many :styles, through: :recipe_styles
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
  
  belongs_to :chef, counter_cache: true

  paginates_per 5
end
