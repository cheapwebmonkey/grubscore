json.array!(@businesses) do |business|
  json.extract! business, :business_id, :name, :address, :city, :state, :postal_code, :phone_number
  json.url business_url(business, format: :json)
end
