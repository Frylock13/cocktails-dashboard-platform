class Style < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :flag, styles: { thumb: "100x100" }, default_url: "missings/style.png"
  validates_attachment_content_type :flag, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :slug, presence: true, uniqueness: true
  
  has_many :recipe_styles, dependent: :destroy
  has_many :recipes, through: :recipe_styles
end
