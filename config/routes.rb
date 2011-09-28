GoalaraCom::Application.routes.draw do
  # devise_for :users do
  #     get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  #     get "/users/sign_in" => "sessions#create", :as => :new_user_session
  #   end
  
  root :to => "articles#index"
  
  devise_for :users, :controllers => {:sessions => 'sessions'}

  resources :users

  resources :viewers

  resources :feeds

  resources :articles

  resources :organizations

  resources :teams
  
  resources :frontpage
  
  resources :comments
  
  resources :votes
  
  # comment_vote_path
  get "/comment-vote" => "comments#vote", :as => :comment_vote_path
  
  # match "/oauth/start" => "oauth#start"
  #   match "/oauth/callback" => "oauth#callback"
  #   match "/oauth/client" => "oauth#client"
  devise_scope :user do
  
    match "login" => "sessions#sign_in_and_redirect", :as => :new_user_session_remote 
    match "logout" => "sessions#destroy", :as => :destroy_user_session
    match "register" => "devise/registrations#new", :as => :new_user_registration
  end
  
  match "set_teams" => "articles#set_teams"
  
  match "/navigate" => "articles#fetch"
  
  match "/news/:team_name" => "articles#show"
  match "/news" => "articles#show", :as => :navigator
  
  match "/application.manifest" => Rails::Offline
  
  match "/feed" => "articles#rss"
  
  match "/help" => "pages#help"
  
  
  
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
