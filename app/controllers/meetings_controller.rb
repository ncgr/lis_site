
class MeetingsController < ApplicationController
  
  before_filter :authenticate_user!
  filter_access_to :all
  
  def index
    @meetings = Meeting.order("start_date ASC").all
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
