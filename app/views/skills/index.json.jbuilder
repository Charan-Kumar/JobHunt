json.array!(@positions) do |position|
  json.extract! position, :id, :title, :summary, :start_date, :end_date, :is_current, :company, :full_profile_id
  json.url position_url(position, format: :json)
end
