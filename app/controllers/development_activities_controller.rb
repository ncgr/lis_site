##
# DevelopmentActivities Controller
# 
# Author: Ken Seal - NCGR
#

class DevelopmentActivitiesController < ApplicationController
    
    def index
        # HTML
        @activities = DevelopmentActivity.paginate_by_params(params[:page])
    end
    
end
