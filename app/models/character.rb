class Character < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :pets
  has_one :dragon, dependent: :destroy, foreign_key: :rider_id
  
  has_many :relationships
  has_many :relatives, through: :friendships
  has_many :inverse_relationships, :class_name => "Relationship", foreign_key: :relative_id
  has_many :inverse_friends, through: :inverse_relationships, source: :character
  
  validates :name, presence: true, uniqueness: true
  validates :character_type, presence: true
  
  default_scope { order("name ASC")}
  
  scope :recent, ->{ where("created_at > ?", 2.weeks.ago) }
  scope :updated, ->{ where("updated_at > ?", 2.weeks.ago) }
  scope :display, ->{ where(approved: true, active: true) }
  scope :non_rider, ->{ where.not(character_type: "Dragonrider") }
  
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
  
  def impress_to(egg)
    unless self.dragon
      self.create_dragon({name: egg.creature_name, color: egg.creature_color, age: 0, description: egg.creature_appearance, personality: egg.creature_personality})
      self.character_type = "Weyrling"
      self.rank = "Weyrling"
      self.save
    end
  end
  
end
