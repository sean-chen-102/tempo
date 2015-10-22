class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:edit_activity, :destroy_activity]

	# CUSTOM CODE

	# Create an Activity in the database for the given params
	# POST /api/activities
	def create_activity
	  @activity = Activity.new(activity_params)

	  respond_to do |format|
	    if @activity.save
	      #format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
	      format.json { render :show, status: :created, location: @activity }
	    else
	      #format.html { render :new }
	      format.json { render json: @activity.errors, status: :unprocessable_entity }
	    end
	  end
	end

  	# Edit the fields of a specified Activity 
	# PUT /api/activities/:id
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

	# Return a JSON response with a list of all activities
	# GET /api/activities
	def get_activities
		activities = Activity.all
		json_response = { status: 1, data: activities }

		respond_to do |format|
			format.json { render json: json_response }
		end
	end

	# Deletes specified Activity from database
	# DELETE /activities/:id
	def destroy_activity
	  @activity.destroy
	  respond_to do |format|
	    #format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

	# Return a JSON response with a list of given activities based on the param: interest
	# GET /api/activities
	# URL format: '/api/activities?interest:<interest_name>'
	def get_activities_for_interest
	  interest_key = "interest"
	  interest = params[interest_key]
	  activities = Activity.get_activities(interest)
	  json_response = activities

	  respond_to do |format|
	    # format.html # show.html.erb
	    format.json { render json: json_response }
	  end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_activity
	    @activity = Activity.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def activity_params
	    params.require(:activity).permit(:title, :completion_time, :link, :content_type, :content)
    end
end
