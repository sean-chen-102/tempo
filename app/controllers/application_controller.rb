class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
	# TODO: this is probably not secure
	protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

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

end
