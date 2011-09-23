class ApplicationController < ActionController::Base
  protect_from_forgery
  
  check_authorization :unless => :devise_controller?
  
  before_filter :xhr_to_json

  def xhr_to_json
    request.format = :json if request.xhr?
  end
  
  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end
  
end
