LisSite::Application.routes.draw do
  
  resources :news_articles, :development_activities
  resources :pages, :only => :show

  root :to => "home#index"
end
