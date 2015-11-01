json.array!(@businesses) do |business|
  json.extract! business, :business_id, :name, :address, :score
  json.url business_url(business, format: :json)
end
