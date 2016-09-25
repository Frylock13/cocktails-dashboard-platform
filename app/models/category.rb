class Category < ApplicationRecord

  include Imagable

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_attached_file :image, styles: { thumb: "64x64>" }, default_url: "missings/category.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :recipes
end
