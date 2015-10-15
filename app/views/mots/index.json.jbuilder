json.array!(@mots) do |mot|
  json.extract! mot, :id, :abreviation, :signification
  json.url mot_url(mot, format: :json)
end
