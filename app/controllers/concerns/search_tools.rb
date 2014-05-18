module SearchTools
  
  def search(search)
    (search_character_name(search) + search_pet_name(search) + search_dragon_name(search)).uniq
  end
  
  def search_character_name(search)
    Character.display.where("name ILIKE ?", "%#{search}%")
  end
  
  def search_pet_name(search)
    Character.joins(:pets).where("pets.name ILIKE ?", "%#{search}%")
  end
  
  def search_dragon_name(search)
    Character.joins(:dragon).where("dragons.name ILIKE ?", "%#{search}%")
  end
  
  private
  
  def set_character
    @character = Character.find_by(name: params[:character_id])
  end
  
  def set_clutch
    @clutch = Clutch.find(params[:clutch_id])
  end
  
end