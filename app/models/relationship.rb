class Relationship < ActiveRecord::Base
  belongs_to :character
  belongs_to :relative, :class_name => "Character"
end
