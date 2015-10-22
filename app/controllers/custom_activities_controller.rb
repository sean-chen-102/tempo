class CustomActivitiesController < ApplicationController
	before_action :set_custom_activity, only: [:edit_custom_activity, :destroy_custom_activity]
	
	# Create a CustomInterest in the database for the given params
	# POST /api/custom_activities
	def create_custom_activity 
	  @custom_activity = CustomActivity.new(custom_activity_params)
	
	  respond_to do |format|
	    if @custom_activity.save
	      # format.html { redirect_to @custom_activity, notice: 'Custom activity was successfully created.' }
	      format.json { render :show, status: :created, location: @custom_activity }
	    else
	      # format.html { render :new }
	      format.json { render json: @custom_activity.errors, status: :unprocessable_entity }
	    end
	  end
	end
	
	# Edit the fields of a specified CustomActivity
	# PUT /api/custom_activities/:id
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
	def get_custom_activities
	  activities = CustomActivity.all
	  json_response = { status: 1, data: activities }

	  respond_to do |format|
	    # format.html # show.html.erb
	    format.json { render json: json_response }
	  end
	end
	
	# Deletes specified CustomActivity from database
	# DELETE /api/custom_activities/:id
	def destroy_custom_activity
	  @custom_activity.destroy
	  respond_to do |format|
	    # format.html { redirect_to custom_activities_url, notice: 'Custom activity was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end
	
	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_custom_activity
	    @custom_activity = CustomActivity.find(params[:id])
	  end
	
	  # Never trust parameters from the scary internet, only allow the white list through.
	  def custom_activity_params
	    params.require(:custom_activity).permit(:title, :completion_time, :content)
	  end
end
