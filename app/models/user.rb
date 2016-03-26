class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  has_one :chef

  after_create :create_chef_profile

  private

  def create_chef_profile
    Chef.create(user_id: self.id)
  end
end
