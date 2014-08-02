class Egg < ActiveRecord::Base
  
  belongs_to :clutch
  belongs_to :post

  default_scope { order("id ASC")}
end
