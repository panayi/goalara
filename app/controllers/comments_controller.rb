class CommentsController < ApplicationController
    respond_to :html, :xml, :json
    
    skip_authorization_check
    
    before_filter :authenticate_user!

    def create
      @article = Article.find(params[:commentable_id])
      @comment = Comment.build_from(@article, current_user.id, params[:body] )

      if @comment.save
        if request.xhr?
          data = render_to_string :partial => "comments/sidebox_single_comment.html.haml", :locals => { :comment => @comment }, :layout => false, :status => :created
          result = {"data" => data}
          render :json => result.to_json
        else
          redirect_to session[:return_to]
        end
      else # validation fails
        if request.xhr?
          render :json => @comment.errors, :status => :unprocessable_entity
        else
          render :action => :new, :status => :unprocessable_entity
        end
      end
      
      
      # respond_to do |format|
      #         format.html { redirect_to session[:return_to] }
      #         format.xml  { head :ok }
      #         format.json { render :json  => resp.to_json }
      #       end
      
    end
    

    def destroy
      session[:return_to] ||= request.referer

      if current_user.admin?
        @comment = Comment.find(params[:id])
      else
        @comment = current_user.comments.find(params[:id])
      end

      @comment.destroy

      respond_to do |format|
        format.html { redirect_to session[:return_to] }
        format.xml  { head :ok }
      end
    end
    
    def vote
    
    end

end

