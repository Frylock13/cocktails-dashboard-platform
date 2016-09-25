class Glass < ApplicationRecord

  include Imagable

  has_many :recipes

  has_attached_file :image, styles: { thumb: "64x64>" }, default_url: "missings/:style/recipe.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  before_create do
    upload_an_image
  end
end
