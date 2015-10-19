json.array!(@custom_activities) do |custom_activity|
  json.extract! custom_activity, :id, :name, :completion_time, :link, :snippet, :content
  json.url custom_activity_url(custom_activity, format: :json)
end
