##
# Pages Controller
# 
# Author: Ken Seal - NCGR
#

class PagesController < ApplicationController
    
    layout "default"
    
    ##
    # Default and only method to display a page.
    # If you need to add another page, add another <page_name>.html.erb file under app/views/pages/.
    #
    def show
        render :action => params[:page]
    end
    
end