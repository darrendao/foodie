json.array!(@establishments) do |establishment|
  json.extract! establishment, :name, :website, :address, :telephone
  json.url establishment_url(establishment, format: :json)
end
