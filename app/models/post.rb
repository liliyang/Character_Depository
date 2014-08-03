class Post < ActiveRecord::Base
  belongs_to :clutch
  has_many :eggs
  
  default_scope { order("id ASC")}
  
  def show_post
    self.reveal = true
    self.save
  end
end
