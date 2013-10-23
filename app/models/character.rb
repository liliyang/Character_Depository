class Character < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :pets
  has_one :dragon, dependent: :destroy, foreign_key: :rider_id
  
  default_scope { order("name ASC")}
  
  scope :recent, ->{ where("created_at > ?", 2.weeks.ago) }
  scope :updated, ->{ where("updated_at > ?", 2.weeks.ago) }
  scope :display, ->{ where(approved: true, active: true) }
  
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
