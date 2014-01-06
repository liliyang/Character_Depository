class Article < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :category, presence: true
  
  before_validation :generate_slug
  
  
  def generate_slug
    self.slug = title.downcase.gsub(/\W/, ' ').strip.gsub(/\W/, '-') unless self.slug
  end
  
  def to_param
    "#{self.slug}"
  end
end
