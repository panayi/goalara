class FrontpageController < ApplicationController
  def index
    
    if !params[:order_by]
      @order_by = 'id'
    else
      @order_by = params[:order_by]
    end
    
    if !params[:filter_by]
      @articles = Article.order(@order_by).all
    else
      @articles = Article.order(@order_by).where(params[:type] + '= ?', params[:filter_by])
    end
    
    @teams = Team.all
    @organizations = Organization.all
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
