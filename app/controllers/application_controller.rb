class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :xhr_to_xml

  def xhr_to_xml
    request.format = :xml if request.xhr?
  end
  
end
