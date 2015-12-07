class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:edit_activity, :destroy_activity, :get_activity, :get_interests, :like, :dislike, :get_like_count, :complete_activity]

	# CUSTOM CODE

	# for backbone routing
	def index
	end

	# Create an Activity in the database for the given params
	# POST /api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!"} }' http://localhost:3000/api/activities
	# TODO: only allow admins to do this
	def create_activity
	  activity_key = "activity"
	  json_response = {}
	  status = -1

	  @activity = Activity.new(activity_params)
	  if @activity.save 
	    status = 1
	    activity_data = @activity.as_json
	    json_response["activity"] = activity_data
	  else
	    error_list = process_save_errors(@activity.errors)
	    json_response["errors"] = error_list
	  end

	  json_response["status"] = status
	  json_response = json_response.to_json

	  respond_to do |format|
	    format.json { render json: json_response }
	  end
	end

	# Edit the fields of a specified Activity 
	# PUT /api/activities/:id
	# TODO: update this API request to only allow admins to do this
	def edit_activity
		status = -1
		json_response = {}
		error_list = []
		id = params["id"]
		activity = Activity.find_by(id: id)
		
		if not activity.nil?
			if activity.update(activity_params)
				status = 1
				json_response["activity"] = activity
			else
				error_list << activity.errors
			end
		else
			error_list.append("Error: activity ##{id} doesn't exist.")
		end

		if status != 1
			json_response["errors"] = error_list
		end

		json_response["status"] = status
		json_response = json_response.to_json

	  respond_to do |format|
	    format.json { render json: json_response }
	  end
	end

	# Deletes specified Activity from database
	# DELETE /activities/:id
	# Testing via curl: curl -H "Content-Type: application/json" -X DELETE http://localhost:3000/api/activities/8
	# TODO: only allow admins to do this
	def destroy_activity
	  status = -1
	  json_response = {}
	  error_list = []

	  if not @activity.nil? # if the Activity exists
	    @activity.destroy # delete the Activity from the database
	    status = 1
	  else
	    error_list.append("Error: activity ##{params[:id]} does not exist.")
	  end

	  if status == -1
	    json_response["errors"] = error_list
	  end

	  json_response["status"] = status
	  json_response = json_response.to_json

	  respond_to do |format|
	    format.json { render json: json_response }
	  end
	end

	# Returns a JSON response with the fields of a specified activity 
	# GET /api/activities/:id
	# URL format: '/api/activities/:id'
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities/1
	def get_activity
		status = -1
		json_response = {}
		error_list = []

		if !@activity.nil?
			status = 1
			json_response["activity"] = @activity.as_json
		else
			error_list.append("Error: activity does not exist.")
		end

		if status != 1
  		json_response["errors"] = error_list
  	end

  	json_response["status"] = status
  	json_response = json_response.to_json

  	respond_to do |format|
    	format.json { render json: json_response }
  	end
	end

	# Return a JSON response with a list of given activities based on the params: interest and time
	# GET /api/activities
	# URL format: '/api/activities?interest=<interest_name>&time=<time>'
	# NOTE: if you also include a valid "token" and matching "user_id" in this request, you will also receive
	# the specified User's CustomActivities in the list that match the filters.
	# Testing via curl: curl -H "Content-Type: application/json" -X GET -d '{"time":5}' http://localhost:3000/api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET -d '{"interests": ["news","fitness"]}' http://localhost:3000/api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET -d '{"interests": ["news","fitness"], "time": 5}' http://localhost:3000/api/activities
	def get_all_activities
	  status = -1
	  interests_key = "interests"
	  time_key = "time"
	  interests_list = params[interests_key]
	  time = params[time_key]
	  user_id = params["user_id"]
	  token = params["token"]
	  json_response = {}
	  error_list = []
	  custom_activities = []

	  user = User.find_by(id: user_id)
	  activities = Activity.get_activities(interests_list, time)

	  if not token.nil? and not user.nil?
	  	# we would also like to check for CustomActivities
	  	if user_has_permission(User.authenticate_token(token), user.id) # if the token was provided and is valid and the user has permission
	  		custom_activities = CustomActivity.get_filtered_custom_activities(user, time)
	  		status = 1
	  	end
	  end

	  if activities.length > 0 or custom_activities.length > 0
	    status = 1
	    activities = activities + custom_activities
	    activities = activities.shuffle
	    json_response["activities"] = activities
	  else
	  	status = 1
	  	json_response["activities"] = []
	  end

	  json_response["status"] = status
	  json_response = json_response.to_json

	  respond_to do |format|
	    format.json { render json: json_response }
	  end
	end

	# Return a JSON responses with a list of interests that the specified activity belongs to
	# GET api/activities/:id/interests
	# URL format: '/api/activities/:id/interests'
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities/1/interests
	def get_interests_for_activity
		status = -1
		json_response = {}
		error_list = []
		activity_id = params["id"]
		activity = Activity.find_by(id: activity_id)

		if not activity.nil?
			interests = Activity.get_interests(activity.id)    
			status = 1
			json_response['interests'] = interests.as_json
		else
			error_list.append("Error: activity ##{activity_id} does not exist.")
		end

		if status != 1
  			json_response["errors"] = error_list
  		end

  		json_response["status"] = status
  		json_response = json_response.to_json

		respond_to do |format|
			format.json { render json: json_response }
		end

	end

	# Returns the like_count of the specified activity
	# GET /api/activities/:id/like_count
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities/1/like_count
	def get_like_count
		status = -1
		error_list = []
		json_response = {}
		activity_id = params["id"]
		@activity = Activity.find_by(id: activity_id)

		if not @activity.nil?
			status = 1
			json_response["like_count"] = @activity.like_count
			json_response["dislike_count"] = @activity.dislike_count
		else
			error_list.append("Error: activity ##{activity_id} does not exist.")
		end

		if status == -1
  			json_response["errors"] = error_list
  		end

  		json_response["status"] = status
  		json_response = json_response.to_json

		respond_to do |format|
			format.json { render json: json_response }
		end
	end

	# Returns a status code (1 = success, -1 = failure), updates the activity in the database
	# POST /api/activities/:id/like
	# Testing via curl: curl -H "Content-Type: application/json" -d '{ "token": "<token>" }' -X PUT http://localhost:3000/api/activities/1/like
	def like
		status = -1
		json_response = {}
		error_list = []
		token = params["token"]
		@user = User.authenticate_token(token)
		activity_id = params["id"]
		@activity = Activity.find_by(id: activity_id)

		if not @user.nil?
			if not @activity.nil?
				if @user.liked_list.include? @activity.id # we have already liked this
					status = 1
					@user.liked_list.delete(@activity.id) # de-like this activity (we are "de-selecting" the thumbs up to neutral state)
					@user.save
					@activity.like_count = @activity.like_count - 1
					@activity.save
				elsif @user.disliked_list.include? @activity.id # we have already disliked this
					status = 1
					@user.disliked_list.delete(@activity.id) # de-dislike this activity
					@user.liked_list.push(@activity.id) # like this activity (we are switching our dislike to a like)
					@user.save
					@activity.like_count = @activity.like_count + 1
					@activity.dislike_count = @activity.dislike_count - 1
					@activity.save
				else # we have not selected like or dislike
					status = 1
					@user.liked_list.push(@activity.id) # like this activity from neutral state
					@user.save
					@activity.like_count = @activity.like_count + 1
					@activity.save
				end

				if status == 1
					json_response["like_count"] = @activity.like_count
					json_response["dislike_count"] = @activity.dislike_count
				end
			else
				error_list.append("Error: activity ##{activity_id} does not exist.")
			end
		else
			error_list.append(ErrorMessages::AUTHORIZATION_ERROR)
  		status = -2
		end

		if status != 1
			json_response["errors"] = error_list
		end

		json_response["status"] = status
		json_response = json_response.to_json

		respond_to do |format|
			format.json { render json: json_response }
		end
	end

	# Returns a status code (1 = success, -1 = failure), updates the activity in the database
	# POST /api/activities/:id/dislike
	# Testing via curl: curl -H "Content-Type: application/json" -d '{ "token": "<token>" }' -X PUT http://localhost:3000/api/activities/1/dislike
	def dislike 
		status = -1
		json_response = {}
		error_list = []
		token = params["token"]
		@user = User.authenticate_token(token)
		activity_id = params["id"]
		@activity = Activity.find_by(id: activity_id)

		if not @user.nil?
			if not @activity.nil?
				if @user.disliked_list.include? @activity.id # we have already disliked this
					status = 1
					@user.disliked_list.delete(@activity.id) # de-dislike this activity (we are "de-selecting" the thumbs down to neutral state)
					@user.save
					@activity.dislike_count = @activity.dislike_count - 1
					@activity.save
				elsif @user.liked_list.include? @activity.id # we have already liked this
					status = 1
					@user.liked_list.delete(@activity.id) # de-like this activity
					@user.disliked_list.push(@activity.id) # dislike this activity (we are switching our like to a dislike)
					@user.save
					@activity.dislike_count = @activity.dislike_count + 1
					@activity.like_count = @activity.like_count - 1
					@activity.save
				else # we have not selected like or dislike
					status = 1
					@user.disliked_list.push(@activity.id) # dislike this activity from neutral state
					@user.save
					@activity.dislike_count = @activity.dislike_count + 1
					@activity.save
				end

				if status == 1
					json_response["like_count"] = @activity.like_count
					json_response["dislike_count"] = @activity.dislike_count
				end
			else
				error_list.append("Error: activity ##{activity_id} does not exist.")
			end
		else
			error_list.append(ErrorMessages::AUTHORIZATION_ERROR)
  		status = -2
		end

		if status != 1
			json_response["errors"] = error_list
		end

		json_response["status"] = status
		json_response = json_response.to_json

		respond_to do |format|
			format.json { render json: json_response }
		end
	end

	# Adds the Activity to the User's completed_activities list
	# PUT /api/activities/:id/complete
	# Testing via curl: curl -H "Content-Type: application/json" -d '{ "user_id": 1 }' -X PUT http://localhost:3000/api/activities/1/complete
	def complete_activity
		status = -1
		json_response = {}
		error_list = []
		token = params[:token]

		user_id = params["user_id"]
		user = User.find_by(id: user_id)

		if not user.nil?
			if not token.nil? and user_has_permission(User.authenticate_token(token), user.id) # if the token was provided and is valid and the user has permission
				if not @activity.nil?
					status = 1
					completed_activities = user.completed_activities

					if not completed_activities.include? @activity.id # prevent duplicates
						completed_activities.push(@activity.id)
						user.completed_activities = completed_activities
						user.save
					end
					
				else
					error_list.append("Error: activity does not exist")
				end
			else
				error_list.append(ErrorMessages::AUTHORIZATION_ERROR)
    			status = -2
			end	
		else
			error_list.append("Error: user_id is not valid")
		end		

		if status != 1
			json_response["errors"] = error_list
		end

		json_response["status"] = status
		json_response = json_response.to_json

		respond_to do |format|
			format.json { render json: json_response }
		end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_activity
	  	if not params[:id].nil? and params[:id].respond_to?(:to_i)
	  		begin
		    	@activity = Activity.find(params[:id])
		    rescue ActiveRecord::RecordNotFound
      		@activity = nil
      	end
	    end
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def activity_params
	    params.require(:activity).permit(:title, :completion_time, :link, :content_type, :content)
    end
end
