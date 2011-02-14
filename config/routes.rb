ActionController::Routing::Routes.draw do |map|
  map.resources :news_articles, :development_activities
  
  # Only serves static pages.
  map.page ":page", :controller => "pages", :action => "show", :page => /[a-z_]+/
  
  map.root :controller => "home", :action => "index"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
