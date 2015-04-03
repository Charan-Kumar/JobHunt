json.array!(@fav_jobs) do |fav_job|
  json.extract! fav_job, :id, :job_key, :is_fav, :boolean
  json.url fav_job_url(fav_job, format: :json)
end
