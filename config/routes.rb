LisSite::Application.routes.draw do
  
  devise_for :users

  devise_for :user_informations, :path => "user_information", 
    :controllers => { 
      :registrations => "users/registrations", 
      :passwords     => "users/passwords",
      :invitations   => "users/invitations"
    }

  resources :news_articles, :development_activities
  
  resources :user_profiles do
    member do
      get :manage_role
      put :update_role
    end
    collection do
      get :invitations 
    end
  end

  resources :pages, :only => :show

  root :to => "home#index"
end
