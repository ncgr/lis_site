LisSite::Application.routes.draw do
  
  devise_for :users
  devise_for :user_informations, 
    :path => "user_information", 
    :controllers => { 
      :registrations => "users/registrations", 
      :passwords     => "users/passwords"
    } do
    # Redirect to /users/sign_in since I don't know how to disable sign_in
    # and keep the module database_authenticable.
    match "/user_information/sign_in", :to => redirect("/users/sign_in")
  end

  resources :news_articles, :development_activities, :meetings
  
  resources :user_profiles do
    member do
      get :manage_roles
      put :update_roles
    end
    collection do
      get :invitations 
    end
  end

  resources :pages, :only => :show

  root :to => "home#index"
end
