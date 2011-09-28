class SessionsController < Devise::SessionsController
  respond_to :json
  
  
  
  skip_authorization_check  :only => [:index, :show, :rss, :fetch, :create]
  
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
    return sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    @user_panel = render_to_string :partial => "shared/user_top_panel.html.haml"
    @comment_form = render_to_string :partial => "articles/comment_form.html.haml"
    return render :json => {:success => true, :user_panel => @user_panel, :comment_form => @comment_form, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end

  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end
  
  def destroy
    signed_in = signed_in?(resource_name)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :signed_out if signed_in

    # We actually need to hardcode this, as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      # format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
      format.all do
        method = "to_#{request_format}"
        text = {}.respond_to?(method) ? {}.send(method) : ""
        @user_panel = render_to_string :partial => "shared/user_top_panel.html.haml"
        @comment_form = render_to_string :partial => "articles/comment_form.html.haml"
        return render:json => {:text => text, :status => :ok,  :user_panel => @user_panel,  :comment_form => @comment_form}
      end
    end
  end
  
end

