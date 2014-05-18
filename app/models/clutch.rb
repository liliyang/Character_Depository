class Clutch < ActiveRecord::Base

  belongs_to :user
  
  scope :display, ->{ where(approved: true) }
  
  validates :dame, presence: true
  validates :creature_type, presence: true
  validates :date_clutched, presence: true
end
