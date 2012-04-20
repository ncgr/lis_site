
class HomeController < ApplicationController

  # Home page
  def index
    @articles = NewsArticle.order("created_at DESC").limit(1)
    @activities = DevelopmentActivity.order("id DESC").limit(1)
    @meetings = Meeting.where(["end_date >= ?", Time.now.to_date]).order("start_date ASC")
    @welcome = Page.where({:title => 'welcome'}).first
  end

end
