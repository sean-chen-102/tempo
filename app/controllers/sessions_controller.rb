class SessionsController < ApplicationController
  
  session_errors = { missing_username_or_email: "Error: you must provide a username or email address.", 
                     missing_password: "Error: you must provide a password.", 
                     bad_credentials: "Error: the provided username and password do not match.", 
                   }

  # GET 'api/login' 
  # For displaying a login form
  # TODO: probably delete this, we don't deal with forms on the backend
  def new
  end

  # POST 'api/login'
  # Create a new User Session (aka login)
  # Testing: curl -H "Content-Type: application/json" -X POST -d '{"username":"sillysally23","password":"password"}' http://localhost:3000/api/login
  def create
    password_key = "password"
    email_key = "email"
    username_key = "username"
    password = params[password_key]
    email = params[email_key]
    username = params[username_key]
    errors = []
    authentication_successful = false
    status = -1
    json_response = {}

    if password.nil?
      # append missing password error
      errors.append(session_errors[missing_password])
    else
      if not email.nil?
        # using email to login
        user = User.find_by(email: email)
      elsif not username.nil?
        # using username to login
        user = User.find_by(username: username)
      else
        # append missing username or email error
        errors.append(session_errors[missing_username_or_email])
      end
    end

    if errors.length == 0
      # we have no errors, proceed with authentication
      if user && user.authenticate(password) # if the user exists and the password is correct
        # send successful authentication message
        authentication_successful = true
        status = 1
      else
        # append bad credentials error
        errors.append(session_errors[bad_credentials])
      end
    end

    json_response["status"] = status # set the response status to -1 or 1

    if authentication_successful
      # no errors produced, login successful
      user_data = { "id": user.id, "name": user.name, "username": user.username, "email": user.email }
      json_response["user"] = user_data
    else
      # send error messages
      json_response["errors"] = errors
    end

    json_response = json_response.to_json
    respond_to do |format|
      format.json { render json: json_response }
    end


  end

  # DELETE 'api/logout'
  # Delete the User Session (aka logout)
  def destroy
  end
end
