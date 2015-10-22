class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected 
  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { 
      |u| u.permit(:email, :name, :username, :current_password, :password, :password_confirmation)
    }

    devise_parameter_sanitizer.for(:sign_up) { 
      |u| u.permit(:email, :name, :username, :password, :password_confirmation) 
    }

    devise_parameter_sanitizer.for(:sign_in) { 
      |u| u.permit(:email, :username, :password) 
    }
  end

end
