class Chef < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :name, presence: true
  validates :email, presence: true,
                    length: { maximum: 30 },
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  before_create { email.downcase! }
end
