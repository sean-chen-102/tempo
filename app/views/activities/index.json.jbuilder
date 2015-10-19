json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :completion_time, :link, :content_type, :content
  json.url activity_url(activity, format: :json)
end
