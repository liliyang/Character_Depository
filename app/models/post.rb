class Post < ActiveRecord::Base
  belongs_to :clutch
  
  default_scope { order("id ASC")}
end
