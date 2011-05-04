
class NewsArticlesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  filter_access_to :new, :create, :edit, :update, :destroy
  
  def index
    # HTML
    @articles = NewsArticle.order("timestamp DESC").page(params[:page])
    # RSS Feed
    @rss = NewsArticle.order("timestamp DESC").all
  end
  
  def new
    @article = NewsArticle.new
  end
  
  def create
    @article = NewsArticle.new(params[:news_article])
    if @article.save
      flash[:notice] = "Successfully created news article."
      redirect_to news_articles_path
    else
      render :action => "new"
    end
  end
  
  def show
    @article = NewsArticle.find(params[:id])
  end
  
  def edit
    @article = NewsArticle.find(params[:id])
  end
  
  def update
    @article = NewsArticle.find(params[:id])
    if @article.update_attributes(params[:news_article])
      flash[:notice] = "Successfully updated news article."
      redirect_to news_articles_path
    else
      render :action => "new"
    end
  end
  
  def destroy
    @article = NewsArticle.find(params[:id])
    if @article.destroy
      flash[:notice] = "Successfully deleted news article."
      redirect_to news_articles_path
    else
      flash[:error] = "Unable to delete news article."
      render :action => "index"
    end
  end
    
end
