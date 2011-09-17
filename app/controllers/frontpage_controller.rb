class FrontpageController < ApplicationController
  def index
    
    @articles = Article.find(:all, :order => "id DESC")
    @teams = Team.all
    @organizations = Organization.all
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
