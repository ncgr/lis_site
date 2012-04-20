
class NewsArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  filter_access_to :new, :create, :edit, :update, :destroy

  before_filter :set_tool_bar, :only => [:new, :create, :edit]

  def index
    # HTML
    @articles = NewsArticle.order("created_at DESC").page(params[:page])
    # RSS Feed
    @rss = NewsArticle.order("created_at DESC").all
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
