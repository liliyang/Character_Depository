class Post < ActiveRecord::Base
  belongs_to :clutch
  has_many :eggs
  
  default_scope { order("id ASC")}
end
