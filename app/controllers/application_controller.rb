class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
	# TODO: this is probably not secure
	protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

	# Define hard-coded error messages
	class ErrorMessages
	  AUTHORIZATION_ERROR = "Error: you aren't authorized to perform this action."
	end

	# For constructing consistent JSON responses
	class JsonResponse
		def initialize(response_hash={})
			@response_hash = response_hash
		end

		def set_status(code)
			@response_hash["status"] = code
		end

		def set_data(key, value)
			@response_hash[key] = value
		end

		def set_errors(error_list)
			@response_hash["errors"] = error_list
		end

		def replace_hash(new_hash)
			@response_hash = new_hash
		end

		def get_json
			return @response_hash.to_json
		end
	end

	# Catch any undefined routes
	def catch
		json_response = { "status": -1, "message": "Route not found" }.to_json
		respond_to do |format|
			format.json { render json: json_response }
      format.html { render :error_404 } # display custom 404 page if User enters URL wrong
		end
	end

	protected

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

	# Returns true if the given client_user has permission to perform the given action
	# on the User's data with the given id=user_id_to_modify
	def user_has_permission(client_user, user_id_to_modify)
		if client_user.nil? or user_id_to_modify.nil?
			return false
		elsif client_user.id == user_id_to_modify # user's can modify their own data
			return true
		else
			return false
		end
	end

end
