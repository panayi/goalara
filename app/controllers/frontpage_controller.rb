class FrontpageController < ApplicationController
  respond_to :json
  
  def index
      
    @teams = Team.all
    @organizations = Organization.all
    
    if request.xhr?
      request.format = :json
      response['main'] = render_to_string :partial => "frontpage/articles_list.html.haml"
    end
    
    respond_to do |format|
      format.html
      format.js{ render :json  => response.to_json }
    end
  end
  
end
