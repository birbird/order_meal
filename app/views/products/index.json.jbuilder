json.array!(@products) do |product|
  json.extract! product, :id, :name, :picture, :description, :price
  json.url product_url(product, format: :json)
end
