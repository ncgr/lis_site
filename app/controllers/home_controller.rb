
class HomeController < ApplicationController
  
  # Home page
  def index
    @articles = NewsArticle.order("timestamp DESC").limit(1)
    @activities = DevelopmentActivity.order("id DESC").limit(1)
    @meetings = Meeting.where(["end_date >= ?", Time.now.to_date]).order("start_date ASC").limit(3)
  end

end
