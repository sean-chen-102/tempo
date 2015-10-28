class CustomActivitiesController < ApplicationController
	before_action :set_custom_activity, only: [:edit_custom_activity, :destroy_custom_activity]

	# Create a CustomInterest in the database for the given params
	# POST /api/custom_activities
	# Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"custom_activity": {"title": "Title", "completion_time": 10, "content": "Lorem ipsum content here!", "user_id": 1} }' http://localhost:3000/api/custom_activities
	def create_custom_activity 
		json_response = {}
		status = -1
		@custom_activity = CustomActivity.new(custom_activity_params)

		if @custom_activity.save
			status = 1
			activity_data = @custom_activity.as_json
			json_response["custom_activity"] = activity_data
		else
			error_list = process_save_errors(@custom_activity.errors)
			json_response["errors"] = error_list
		end

		json_response["status"] = status
		json_response = json_response.to_json

		respond_to do |format|
			format.json { render json: json_response }
		end
	end

	# Edit the fields of a specified CustomActivity
	# PUT /api/custom_activities/:id
	# Testing via curl: curl -H "Content-Type: application/json" -X POST -d '{"custom_activity": {"title": "Title", "completion_time": 10, "content_type": "text", "link": "https://www.google.com", "content": "Lorem ipsum content here!"} }' http://localhost:3000/api/custom_activities/1
	def edit_custom_activity
		respond_to do |format|
			if @custom_activity.update(custom_activity_params)
				# format.html { redirect_to @custom_activity, notice: 'Custom activity was successfully updated.' }
				format.json { render :show, status: :ok, location: @custom_activity }
			else
				# format.html { render :edit }
				format.json { render json: @custom_activity.errors, status: :unprocessable_entity }
			end
		end
	end

	# Return a JSON response with a list of all CustomActivities
	# GET /api/custom_activities
	# Testing via curl: curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/custom_activities
	def get_custom_activities
		json_response = {}
		activities_list = []
		error_list = []

		status = -1
		@activities = CustomActivity.all

		if not @activities.empty?
			status = 1
			@activities.each do |activity|
				activity_data = { "id": activity.id, "title": activity.title, "content": activity.content, "completion_time": activity.completion_time }
				activity_data = activity_data.as_json
				activities_list.append(activity_data)
			end

			json_response["custom_activities"] = activities_list
		else
			error_list.append("Error: there are no custom_activities")
		end

		if status == -1
			json_response["errors"] = error_list
		end

		json_response["status"] = status
		json_response = json_response.to_json

		respond_to do |format|
			# format.html # show.html.erb
			format.json { render json: json_response }
		end
	end

	# Deletes specified CustomActivity from database
	# DELETE /api/custom_activities/:id
	# Testing via curl: curl -H "Content-Type: application/json" -X DELETE http://localhost:3000/api/custom_activities/1
	def destroy_custom_activity
		json_response = {}
		error_list = []
		status = -1 

		if not @custom_activity.nil?
			@custom_activity.destroy
			status = 1
		else
			error_list.append("Error: custom_activity ##{params[:id]} does not exist.")
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
	def set_custom_activity
		if not params[:id].nil? and params[:id].respond_to?(:to_i)
			begin
				@custom_activity = CustomActivity.find(params[:id])
			rescue ActiveRecord::RecordNotFound
          		@user = nil
        	end
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def custom_activity_params
		params.require(:custom_activity).permit(:title, :completion_time, :content, :user_id)
	end
end
