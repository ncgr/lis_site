##
# Home Controller
# 
# Author: Ken Seal - NCGR
#

class HomeController < ApplicationController
  
  # Home page
  def index
      @articles = NewsArticle.get_recent_news()
  end

end
