json.array!(@ims) do |im|
  json.extract! im, :id, :im-account-type, :im-account-name, :user_id
  json.url im_url(im, format: :json)
end
