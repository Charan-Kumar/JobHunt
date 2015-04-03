json.array!(@educations) do |education|
  json.extract! education, :id, :school_name, :field_of_study, :start_date, :end_date, :degree, :activities, :notes, :full_profile_id
  json.url education_url(education, format: :json)
end
