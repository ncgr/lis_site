##
# DevelopmentActivities Controller
# 
# Author: Ken Seal - NCGR
#

class DevelopmentActivitiesController < ApplicationController
    
    layout "default"
    
    def index
        # HTML
        @activities = DevelopmentActivity.paginate_by_params(params[:page])
    end
    
end
