class ArticlesController < ApplicationController
  
  skip_authorization_check  :only => [:index, :show, :rss, :fetch] 
  
  include ApplicationHelper
  
  impressionist :actions=>[:show,:fetch]
  
  respond_to :json
  
  # GET /articles
  # GET /articles.xml
  def index
    
    @articles = Article.get_articles(params)
    
    @teams = Team.all
    @organizations = Organization.all
    
    if request.xhr?
      request.format = :json
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  {render :partial => "list.html.haml"}
      format.json {
        @list = render_to_string(:partial => "/articles/list.html.haml")
        @pagination_links = render_to_string(:partial => "/articles/pagination_links.html.haml")
        render :json => { :data => @list, :pages => @pagination_links }
      }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
 
    respond_to do |format|
      format.html {
        @teams = Team.all
        # TODO: get only articles in the last 2 days    
        @articles = Article.get_articles(params)
        render :layout => 'navigator'
      }
      format.xml  { 
        @article = Article.find(params[:id], :include => :team)
        render :xml => @article.team_ids 
      }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_teams
    @articles = Article.where(:validated => false)
    @teams = Team.all
    
    if !params[:team_ids].nil?
      a = Article.find(params[:id])
      a.team_ids = params[:team_ids]
      a.validated = true
      a.save
    end
    
    respond_to do |format|
      format.html # set_teams.html.haml
      format.xml  { head :ok }
    end
  end
  
  def rss
    @articles = Article.find(:all, :order => "id DESC", :limit => 30)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
  
  
  
  def fetch
    if params[:status] == 'team_change' #then ignore article_id
      @article = Article.belongs_to_team(params[:team_id]).first
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
      
      @comments_list = render_to_string :partial => "articles/comments_list.html.haml"
      @navigation_buttons = render_to_string :partial => "articles/navigation_buttons.html.haml"
      @iframe =   render_to_string :partial => "articles/article-iframe.html.haml"
      
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
       @main = render_to_string :partial => "articles/no_article.html.haml"
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
