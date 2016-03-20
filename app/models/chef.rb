class Chef < ApplicationRecord

  has_attached_file :avatar, styles: { thumb: "100x100", medium: "250x250>", large: "500x500" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :name, presence: true
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  before_create { email.downcase! }

  has_many :recipes
end
