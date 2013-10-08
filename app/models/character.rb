class Character < ActiveRecord::Base
  
  before_save :check_candidate, :check_rider
  
  has_many :pets
  has_one :dragon, dependent: :destroy, foreign_key: :rider_id
  
  scope :candidate, where(candidate: true)
  
  def check_candidate
    if age > 23 
      self.candidate = false
    end
  end
  
  def check_rider
    if dragon
      self.rider = true
    end
  end
end
