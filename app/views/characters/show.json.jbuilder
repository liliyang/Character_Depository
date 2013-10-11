json.extract! @character, :name, :pronunciation, :character_type, :rank, :age, :gender, :description, :personality, :history, :created_at, :updated_at
json.extract! @character.dragon, :name, :color, :age, :description, :personality
