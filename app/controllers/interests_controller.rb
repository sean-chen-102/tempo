class InterestsController < ApplicationController
  before_action :set_interest, only: [:edit_interest, :destroy_interest]

  # CUSTOM CODE

  # Create an Interest in the database for the given params
  # POST /api/interests
  def create_interest
    @interest = Interest.new(interest_params)

    respond_to do |format|
      if @interest.save
        # format.html { redirect_to @interest, notice: 'Interest was successfully created.' }
        format.json { render :show, status: :created, location: @interest }
      else
        # format.html { render :new }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edit the fields of a specified Interest
  # PUT /api/interests/:id
  def edit_interest
    respond_to do |format|
      if @interest.update(interest_params)
        # format.html { redirect_to @interest, notice: 'Interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest }
      else
        # format.html { render :edit }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # Return a JSON response with a list of all interests
  # GET /api/interests
  def get_interests
<<<<<<< HEAD
    status = -1
    interests = Interest.get_interests()
    json_response = {}

    if interests.length > 0
      status = 1
      json_response["interests"] = interests
    else
      json_response["errors"] = "Error: no interests found."
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  # Deletes specified Interest from database
  # DELETE /api/interests/:id
  def destroy_interest
    @interest.destroy
    respond_to do |format|
      # format.html { redirect_to interests_url, notice: 'Interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name)
    end
end
