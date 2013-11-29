json.array!(@lenses) do |lens|
  json.extract! lens, :name, :user_id
  json.url lens_url(lens, format: :json)
end
