json.array!(@quota) do |quotum|
  json.extract! quotum, :id, :_date, :product_id, :quantity
  json.url quotum_url(quotum, format: :json)
end
