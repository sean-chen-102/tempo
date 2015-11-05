class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:edit_activity, :destroy_activity, :get_activity, :get_interests, :like, :dislike, :get_like_count]

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
	  respond_to do |format|
	    if @activity.update(activity_params)
	      #format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
	      format.json { render :show, status: :ok, location: @activity }
	    else
	      #format.html { render :edit }
	      format.json { render json: @activity.errors, status: :unprocessable_entity }
	    end
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

		if !@activity.nil?
			status = 1
			json_response["activity"] = @activity.as_json
		else
			error_list.append("Error: activity does not exist.")
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

	# Return a JSON response with a list of given activities based on the params: interest and time
	# GET /api/activities
	# URL format: '/api/activities?interest=<interest_name>&time=<time>'
	# Testing via curl: curl -H "Content-Type: application/json" -X GET -d '{"time":5}' http://localhost:3000/api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET -d '{"interests": ["news","fitness"]}' http://localhost:3000/api/activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET -d '{"interests": ["news","fitness"]}', "time": 5}' http://localhost:3000/api/activities
	def get_activities
	  status = -1
	  interests_key = "interests"
	  time_key = "time"
	  interests_list = params[interests_key]
	  time = params[time_key]
	  activities = Activity.get_activities(interests_list, time)
	  json_response = {}
	  error_list = []

	  if activities.length > 0
	    status = 1
	    json_response["activities"] = activities
	  elsif not interests_list.nil?
	  	error_list.append("Error: no activities found with the given interest.")
	  else
	  	error_list.append("Error: no activities found.")
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

	# Return a JSON responses with a list of interests that the specified activity belongs to
	# GET api/activities/:id/interests
	# URL format: '/api/activities/:id/interests'
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities/1/interests
	def get_interests_for_activity
		status = -1
		json_response = {}
		error_list = []

		if !@activity.nil?
			interests = Activity.get_interests(@activity.id)    
			status = 1
			json_response['interests'] = interests.as_json
		else
			error_list.append("Error: activity does not exist")
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

	# Returns the like_count of the specified activity
	# GET /aip/activities/:id/like_count
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/activities/1/like_count
	def get_like_count
		status = -1
		error_list = []
		json_response = {}

		if not @activity.nil?
			status = 1
			json_response["like_count"] = @activity.like_count
		else
			error_list.append("Error: activity does not exist")
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
	# Testing via curl: curl -H "Content-Type: application/json" -d '{ "user_id": 1 }' -X POST http://localhost:3000/api/activities/1/like
	def like
		status = -1
		json_response = {}
		error_list = []
		
		user_id = params["user_id"]
		user = User.find(user_id)

		if not user.nil?
			if not @activity.nil?

				# Check if user is in like list
				if @activity.user_liked_list.include? user_id
					error_list.append("Error: user has already liked this activity")
				else 

					# If user has previously disliked post, we need to add two instead of one
					if @activity.user_disliked_list.include? user_id
						@activity.user_disliked_list.delete(user_id)
						@activity.like_count = @activity.like_count + 2
					else
						@activity.like_count = @activity.like_count + 1
					end

					@activity.user_liked_list.push(user_id)
					if @activity.save
						status = 1
						json_response["like_count"] = @activity.like_count
					else
						error_list.append("Error: could not save new like_count")
					end

				end

			else
				error_list.append("Error: activity does not exist")
			end
		else
			error_list.append("Error: user_id is not valid")
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
	# POST /api/activities/:id/dislike
	# Testing via curl: curl -H "Content-Type: application/json" -d '{ "user_id": 1 }' -X POST http://localhost:3000/api/activities/1/dislike
	def dislike 
		status = -1
		json_response = {}
		error_list = []

		user_id = params["user_id"]
		user = User.find(user_id)

		if not user.nil?
			if not @activity.nil?

				# Check if user is in like list
				if @activity.user_disliked_list.include? user_id
					error_list.append("Error: user has already disliked this activity")
				else 

					# If user has previously liked post, we need to subtract two instead of one
					if @activity.user_liked_list.include? user_id
						@activity.user_liked_list.delete(user_id)
						@activity.like_count = @activity.like_count - 2
					else
						@activity.like_count = @activity.like_count - 1
					end

					@activity.user_disliked_list.push(user_id)
					if @activity.save
						status = 1
						json_response["like_count"] = @activity.like_count
					else
						error_list.append("Error: could not save new like_count")
					end

				end

			else
				error_list.append("Error: activity does not exist")
			end
		else
			error_list.append("Error: user_id is not valid")
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
