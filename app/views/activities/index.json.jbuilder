json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :completion_time, :link, :snippet, :content
  json.url activity_url(activity, format: :json)
end
