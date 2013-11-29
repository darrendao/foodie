json.array!(@reviews) do |review|
  json.extract! review, :rating, :comment
  json.url review_url(review, format: :json)
end
