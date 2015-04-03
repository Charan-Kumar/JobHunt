json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :address
  json.url address_url(address, format: :json)
end
