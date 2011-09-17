class VotesController < ApplicationController
  
  # GET /teams/new
  # GET /teams/new.xml
  def new
    
    @voter = User.find_by_id(params[:user_id])
    @voteable = Comment.find_by_id(params[:comment_id])
    if !@voter.voted_on?(@voteable)
      if params[:vote] == "up"
        @voter.vote_for(@voteable)
      else
        @voter.vote_against(@voteable)
      end
      status = @voteable.plusminus
    else
      status = "already_voted"
    end
    
    if request.xhr?
      render :json  => {:status => status, :vote => params[:vote]}.to_json
    else
      redirect_to :back
    end
    
  end
end
