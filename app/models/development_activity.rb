##
# DevelopmentActivity Model
# 
# Author: Ken Seal - NCGR
#

class DevelopmentActivity < ActiveRecord::Base
    
    def self.get_recent_activities(limit = nil)
        limit ||= 1
        return find(:all, :order => "id DESC", :limit => limit)
    end
    
    def self.paginate_by_params(page, order = nil)
        order ||= "id DESC"
        return paginate(:all, :per_page => 20, :page => page, :order => order)
    end
    
end