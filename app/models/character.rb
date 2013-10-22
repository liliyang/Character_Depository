class Character < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :pets
  has_one :dragon, dependent: :destroy, foreign_key: :rider_id
  
  scope :recent, ->{ where("created_at > ?", 2.weeks.ago) }
  scope :updated, ->{ where("updated_at > ?", 2.weeks.ago) }
  
  def has_dragon?
    if self.dragon
      true
    else
      false
    end
  end
  
  def to_param
    "#{self.name}"
  end
  
end
