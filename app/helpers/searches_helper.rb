module SearchesHelper
  
  def search(search)
    search_character_name(search)
  end
  
  def search_character_name(search)
    Character.display.where("name LIKE ?", "%#{search}%")
  end
  
  def search_pet_name(search)
    Character.joins(:pets).where("pets.name" => search)
  end
  
  def search_dragon_name(search)
    Dragon.where("name LIKE ?", "%#{search}%")
  end
  
  
end
