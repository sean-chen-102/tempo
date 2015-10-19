json.array!(@custom_activities) do |custom_activity|
  json.extract! custom_activity, :id, :title, :completion_time, :content
  json.url custom_activity_url(custom_activity, format: :json)
end
