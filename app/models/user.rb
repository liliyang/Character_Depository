class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :registration_notification
  
  has_many :characters, dependent: :destroy
  has_many :clutches
  
  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 16 }
  validates :username, presence: true, length: { maximum: 25}, uniqueness: true, format: { without: /\s/ }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length: { minimum: 6 }, :if => :should_validate_password?
  attr_accessor :updating_password
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def to_param
    "#{self.username}"
  end
  
  def should_validate_password?
    updating_password || new_record?
  end
  
  private
  
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
  
  def registration_notification
    UserMailer.registration_confirmation(self).deliver
  end
  
end
