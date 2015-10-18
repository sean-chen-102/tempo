class CustomActivitiesController < ApplicationController
  before_action :set_custom_activity, only: [:show, :edit, :update, :destroy]

  # GET /custom_activities
  # GET /custom_activities.json
  def index
    @custom_activities = CustomActivity.all
  end

  # GET /custom_activities/1
  # GET /custom_activities/1.json
  def show
  end

  # GET /custom_activities/new
  def new
    @custom_activity = CustomActivity.new
  end

  # GET /custom_activities/1/edit
  def edit
  end

  # POST /custom_activities
  # POST /custom_activities.json
  def create
    @custom_activity = CustomActivity.new(custom_activity_params)

    respond_to do |format|
      if @custom_activity.save
        format.html { redirect_to @custom_activity, notice: 'Custom activity was successfully created.' }
        format.json { render :show, status: :created, location: @custom_activity }
      else
        format.html { render :new }
        format.json { render json: @custom_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_activities/1
  # PATCH/PUT /custom_activities/1.json
  def update
    respond_to do |format|
      if @custom_activity.update(custom_activity_params)
        format.html { redirect_to @custom_activity, notice: 'Custom activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_activity }
      else
        format.html { render :edit }
        format.json { render json: @custom_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_activities/1
  # DELETE /custom_activities/1.json
  def destroy
    @custom_activity.destroy
    respond_to do |format|
      format.html { redirect_to custom_activities_url, notice: 'Custom activity was successfully destroyed.' }
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
      params.require(:custom_activity).permit(:name, :completion_time, :link, :snippet, :content)
    end
end
