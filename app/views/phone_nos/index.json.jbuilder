json.array!(@phone_nos) do |phone_no|
  json.extract! phone_no, :id, :phone_type, :phone_number, :user_id
  json.url phone_no_url(phone_no, format: :json)
end
