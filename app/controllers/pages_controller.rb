class PagesController < ApplicationController
  
  skip_authorization_check
  
  layout "pages"
  
  def help
    @title_image = "titles/help.jpg"
  end
  
end
