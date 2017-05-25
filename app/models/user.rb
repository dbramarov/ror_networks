class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :networks, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :friends, through: :networks, source: :user
  has_many :inviters, through: :invitations, source: :user

  validates :name, :email, :description, presence: true, :on => :create
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :on => :create
  validates :password, :password_confirmation, presence: true, length: {minimum: 8}
end
