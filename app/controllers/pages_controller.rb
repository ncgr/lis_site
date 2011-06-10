
class PagesController < ApplicationController
    
  before_filter :authenticate_user!, :except => [:show, :legume_origins]
  filter_access_to :index, :edit, :update
  
  before_filter :set_tool_bar, :only => :edit
  
  def index
    order_by = check_kaminari_sort(Page, params[:sort], params[:dir])
    @pages = Page.order(order_by).page(params[:page])
  end
  
  def show
    @page = Page.where({:title => params[:id]}).first
    render :action => params[:id]
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    @page.user_id = current_user.id
    @page.updated_at = Time.now
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page updated successfully."
      redirect_to pages_path
    else
      render :action => "new"
    end
  end
  
end