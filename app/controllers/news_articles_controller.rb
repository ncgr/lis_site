##
# NewsArticles Controller
# 
# Author: Ken Seal - NCGR
#

class NewsArticlesController < ApplicationController
    
    layout "default"
    
    def index
        # HTML
        @articles = NewsArticle.paginate_by_params(params[:page])
        # RSS Feed
        @rss = NewsArticle.find(:all, :order => "timestamp DESC")
    end
    
    def show
        @article = NewsArticle.find(params[:id])
    end
    
end
