class Dragon < ActiveRecord::Base
  
  belongs_to :character
  
  validates :name, presence: true, uniqueness: true
  
end
