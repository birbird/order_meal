json.array!(@orders) do |order|
  json.extract! order, :id, :customer_name, :customer_address, :customer_mobile, :product_id, :delivery_man, :is_complete, :note
  json.url order_url(order, format: :json)
end
