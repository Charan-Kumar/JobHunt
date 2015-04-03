json.array!(@basic_profiles) do |basic_profile|
  json.extract! basic_profile, :id, :first_name, :last_name, :maiden_name, :formatted_name, :headline, :location, :industry, :summary, :specialties, :picture_url, :public_profile_url, :user_id
  json.url basic_profile_url(basic_profile, format: :json)
end
