class ApiController < ActionController::Base

# Return a JSON response with a list of given activities based on the param: interest
# GET /api/activities
# URL format: '/api/activities?interest:<interest_name>'
def get_activities
  interest_key = "interest"
  interest = params[interest_key]
  activities = Activity.get_activities(interest)
  json_response = activities

  respond_to do |format|
    # format.html # show.html.erb
    format.json { render json: json_response }
  end
end

# Return a JSON response with a list of given interests
# GET /api/interests
# URL format: '/api/interests?user:<user_id>'
def get_interests
  user_id_key = "user"
  user_id = params[user_id_key]
  interests = Interest.get_interests(user_id)
  json_response = interests

  respond_to do |format|
    # format.html # show.html.erb
    format.json { render json: json_response }
  end
end

end
