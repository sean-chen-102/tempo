class UsersController < ApplicationController
  before_action :set_user, only: [:get_user, :edit_user, :destroy_user, :get_user_interests, :get_user_custom_activities]

  # user authentication token idea: https://gist.github.com/josevalim/fb706b1e933ef01e4fb6

  # CUSTOM CODE

  # Create a User in the database for the given params
  # POST /api/users/
  def create_user
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        # format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Returns a JSON response with a specified User's information
  # GET '/api/users/:id'
  def get_user
    if @user.nil? 
      json_response = { status: -1, errors: "User does not exist!"}.to_json
    else
      json_response = @user
    end

    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  # Gets all Users from the database
  # GET '/api/users'
  def get_users
    json_response = User.all
    respond_to do |format|
      format.json { render json: json_response }
    end
  end

  # Edit the fields of a specified User
  # PUT /api/users/:id
  def edit_user
    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        # format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes specified User from database 
  # DELETE /api/users/:id
  def destroy_user
    if @user.nil?
      json_response = { status: -1, errors: "User does not exist!"}.to_json
    else
      @user.destroy
      json_response = { status: 1 }.to_json
    end
    respond_to do |format|
      # format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { render json: json_response }
    end
  end

  # Return a JSON response with a list of given Interests of a specified User
  # GET '/api/users/:id/interests'
  def get_user_interests
    interests = User.get_interests(@user.id)
    json_response = interests

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  # Return a JSON response with a list of a User's Custom Activities
  # GET /api/users/:id/custom_activities
  def get_user_custom_activities
    custom_activities = User.get_custom_activities(@user.id)
    json_response = custom_activities

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: json_response }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
