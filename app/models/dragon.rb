class Dragon < ActiveRecord::Base
  
  belongs_to :character, foreign_key: :rider_id
  
  validates :name, presence: true, uniqueness: true
  
end
