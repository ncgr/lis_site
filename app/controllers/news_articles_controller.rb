#
# NewsArticles Controller
# 
# Author: Ken Seal - NCGR
#

class NewsArticlesController < ApplicationController
    
  def index
    # HTML
    @articles = NewsArticle.order("timestamp DESC").page(params[:page])
    # RSS Feed
    @rss = NewsArticle.order("timestamp DESC").all
  end
  
  def show
    @article = NewsArticle.find(params[:id])
  end
    
end
