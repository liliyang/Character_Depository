json.array!(@characters) do |character|
  json.extract! character, :name, :character_type, :rank
  json.extract! character.dragon, :name, :color
  json.url character_url(character, format: :json)
end
