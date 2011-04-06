LisSite::Application.routes.draw do
  
  devise_for :users
  devise_for :admins, :controllers => { :registrations => "users/registrations" }

  resources :news_articles, :development_activities
  resources :pages, :only => :show

  root :to => "home#index"
end
