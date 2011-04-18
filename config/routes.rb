LisSite::Application.routes.draw do
  
  devise_for :users do
    # Redirect invitations to the proper model.
    # User needs to inherit devise :invitations to set :invited_by_id, but we 
    # want UserInformation to handle the processing.
    # This is all because we are using the Ruby CAS server for authentication.  
    #match "/users/invitation/accept", :to => redirect("/user_information/invitation/accept")
    #match "/users/invitation",        :to => redirect("/user_information/invitation")
    #match "/users/invitation/new",    :to => redirect("/user_information/invitation/new")
    #match "/users/invitation",        :to => redirect("/user_information/invitation")
  end

  devise_for :user_informations, 
    :path => "user_information", 
    :controllers => { 
      :registrations => "users/registrations", 
      :passwords     => "users/passwords"
      #:invitations   => "users/invitations"
    } do
    # Redirect to /users/sign_in since I don't know how to disable sign_in
    # and keep the module database_authenticable.
    match "/user_information/sign_in", :to => redirect("/users/sign_in")
  end

  resources :news_articles, :development_activities
  
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
