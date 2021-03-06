class User < ApplicationRecord
  has_secure_password
  before_validation {email.downcase!}
  has_many :posts
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, length: {maximum: 25}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

end
