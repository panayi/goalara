class ViewersController < ApplicationController
  include ApplicationHelper
  
  respond_to :json
  
  # GET /viewers
  # GET /viewers.xml
  def index
    @teams = Team.all
    # TODO: get only articles in the last 2 days    
    @articles = Article.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @viewers }
    end
  end

  # GET /viewers/1
  # GET /viewers/1.xml
  def show
    # @article = Article.find_by_id(params[:id])
    #     @prev_article = @article.previous == nil ? 0 : @article.previous
    #     @next_article = @article.next == nil ? 0 : @article.next
    #     @comments = @article.comment_threads.all
    #     @teams = Team.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @viewer }
    end
  end

  # GET /viewers/new
  # GET /viewers/new.xml
  def new
    @viewer = Viewer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @viewer }
    end
  end

  # GET /viewers/1/edit
  def edit
    @viewer = Viewer.find(params[:id])
  end

  # POST /viewers
  # POST /viewers.xml
  def create
    @viewer = Viewer.new(params[:viewer])

    respond_to do |format|
      if @viewer.save
        format.html { redirect_to(@viewer, :notice => 'Viewer was successfully created.') }
        format.xml  { render :xml => @viewer, :status => :created, :location => @viewer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @viewer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /viewers/1
  # PUT /viewers/1.xml
  def update
    @viewer = Viewer.find(params[:id])

    respond_to do |format|
      if @viewer.update_attributes(params[:viewer])
        format.html { redirect_to(@viewer, :notice => 'Viewer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @viewer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /viewers/1
  # DELETE /viewers/1.xml
  def destroy
    @viewer = Viewer.find(params[:id])
    @viewer.destroy

    respond_to do |format|
      format.html { redirect_to(viewers_url) }
      format.xml  { head :ok }
    end
  end
  
  def fetch
    if params[:status] == 'team_change' #then ignore article_id
      @article = Article.find_by_team_id(params[:team_id])
    elsif params[:team_id] != 'all'
      @article = Article.find(:first, :conditions => {:id => params[:id], :team_id => params[:team_id] } )
    else
      @article = Article.find_by_id(params[:id])
    end
    
    @teams = Team.all
    
    if @article
      @prev_article_hash = @article.previous == nil ? '' : @article.previous.id.to_s() + '/' + remove_http(@article.previous.url) + '/tid_' + params[:team_id]
      @next_article_hash = @article.next == nil ? '' : @article.next.id.to_s() + '/' + remove_http(@article.next.url) + '/tid_' + params[:team_id]
      @comments = @article.comment_threads.all
      
      @comments_list = render_to_string :partial => "viewers/comments_list.html.haml"
      @navigation_buttons = render_to_string :partial => "viewers/navigation_buttons.html.haml"
      @iframe =   render_to_string :partial => "viewers/article-iframe.html.haml"
      
      response = {
        'article_id'          => @article.id,
        'iframe'              => @iframe,
        'article_title'       => @article.title,
        'comments'            => @comments_list,
        'navigation_buttons'  => @navigation_buttons,
        'total_comments'      => @comments.size,
        'next_article_hash'   => @next_article_hash,
        'prev_article_hash'   => @prev_article_hash
      }
    else
       @main = render_to_string :partial => "viewers/no_article.html.haml"
       response = { 
         'error' => 'no_results',
         'main'  => @main
         }
    end

    if user_signed_in?
      response['signedin'] = 'true';
    else
      response['signedin'] = 'false';
    end

    if request.xhr?
      request.format = :json
    end
    
    respond_to do |format|
      format.json { render :json  => response.to_json }
    end
    
  end
end
