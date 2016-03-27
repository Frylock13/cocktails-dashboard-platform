class Chef < ApplicationRecord

  has_attached_file :avatar, styles: { thumb: "100x100", medium: "250x250>", large: "500x500"}, default_url: 'chef.png'
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :recipes
  belongs_to :user
end
