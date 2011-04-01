#
# DevelopmentActivities Controller
# 
# Author: Ken Seal - NCGR
#

class DevelopmentActivitiesController < ApplicationController
    
  def index
    @activities = DevelopmentActivity.order("id DESC").page(params[:page])
  end
    
end
