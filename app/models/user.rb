class User < ApplicationRecord
  has_many :articles

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "must be a valid e-mail address" }
  validates :username, :password, length: { minimum: 6, maximum: 18 }
end
