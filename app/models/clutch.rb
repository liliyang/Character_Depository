class Clutch < ActiveRecord::Base

  belongs_to :user
  
  scope :display, ->{ where(approved: true) }
  default_scope { order("creature_type ASC")}
  
  validates :dame, presence: true
  validates :creature_type, presence: true
  validates :date_clutched, presence: true
end
