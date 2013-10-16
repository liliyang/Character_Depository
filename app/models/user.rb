class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  has_many :characters, dependent: :destroy
  
  validates :name, presence: true
  validates :username, presence: true, length: { maximum: 25}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length: { minimum: 6 }
  
end
