json.array!(@characters) do |character|
  json.extract! character, :name, :age, :description
  json.url character_url(character, format: :json)
end
