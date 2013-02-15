class MeetingsController < ApplicationController

  force_ssl :only => [:new, :create, :edit, :update, :destroy]

  before_filter :authenticate_user!
  filter_access_to :all

  before_filter :set_tool_bar, :only => [:new, :create, :edit]

  def index
    order_by = check_kaminari_sort(Meeting, params[:sort], params[:dir])
    @meetings = Meeting.order(order_by).page(params[:page])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    if @meeting.save
      flash[:notice] = "Successfully created meeting."
      redirect_to meetings_path
    else
      render :action => "new"
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(params[:meeting])
      flash[:notice] = "Successfully updated meeting."
      redirect_to meetings_path
    else
      render :action => "new"
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    if @meeting.destroy
      flash[:notice] = "Successfully deleted meeting."
      redirect_to meetings_path
    else
      flash[:error] = "Unable to delete meeting."
      render :action => "index"
    end
  end

end
