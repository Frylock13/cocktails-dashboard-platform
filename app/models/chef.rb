class Chef < ApplicationRecord

  has_attached_file :avatar, styles: { thumb: "100x100", medium: "250x250>", large: "500x500"}, default_url: 'missings/chef.png'
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, presence: true

  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  
  belongs_to :user

  paginates_per 5
end
