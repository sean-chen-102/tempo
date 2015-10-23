class InterestsController < ApplicationController
  before_action :set_interest, only: [:edit_interest, :destroy_interest]

  # CUSTOM CODE

  # Create an Interest in the database for the given params
  # POST /api/interests
  def create_interest
    interest_key = "interest"
    name_key = "name"
    name = params[interest_key][name_key]
    password = params[user_key][password]
    json_response = {}
    status = -1

    @interest = Interest.new(interest_params)
    if @interest.save 
      status = 1
      interest_data = { "id": @interest.id, "name": @interest.name }
      json_response["interest"] = user_data
    else
      error_list = process_save_errors(@interest.errors)
      json_response["errors"] = error_list
    end

    json_response["status"] = status
    json_response = json_response.to_json

    respond_to do |format|
      format.json { render json: json_response }
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
    status = -1
    interests = Interest.get_interests()
    error_list = []
    json_response = {}

    if interests.length > 0
      status = 1
      json_response["interests"] = interests
    else
      error_list.append("Error: no interests found.")
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

  # Deletes specified Interest from database
  # DELETE /api/interests/:id
  def destroy_interest
    status = -1
    json_response = {}
    error_list = []
    interest_id = params[:id]
    @interest = Interest.where(id: interest_id)

    if not @interest.empty? # if the Interest exists
      @interest = @interest.first # get the Interest from the ActiveRecord Relation
      @interest.destroy # delete the Interest from the database
      status = 1
    else
      error_list.append("Error: interest ##{params[:id]} does not exist.")
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

  # Takes in an error hash of the form: { "username": ["has already been taken", "error 2"], "name": ["is too long"] }
  # and converts it to a list of readable errors, e.g. ["Error: username has already been taken.", "Error: username error 2.", 
  # "Error: name is too long."] and returns it.
  def process_save_errors(error_hash)
    error_list = []

    error_hash.each do |key|
      key_errors = error_hash[key]

      key_errors.each do |error|
        new_error = "Error: #{key} #{error}."
        error_list.append(new_error)
      end
    end

    return error_list
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
