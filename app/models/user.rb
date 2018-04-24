class User < ApplicationRecord
  has_secure_password

  # TODO: Write regex for email and username
  validates :username, presence: true
  # TODO: Discus this password validation
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :role, presence: true, 
                   format: { with: /\AADMIN\z/ }
  validates :email, presence: false
end
