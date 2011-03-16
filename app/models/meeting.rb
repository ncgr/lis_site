##
# Meeting Model
# 
# Author: Ken Seal - NCGR
#

class Meeting < ActiveRecord::Base
    
    def self.get_recent_meetings(limit = nil)
        limit ||= 3
        return find(:all, :conditions => ["end_date >= ?", Time.now.to_date], :order => "start_date ASC", :limit => limit)
    end
    
    def self.paginate_by_params(page, order = nil)
        order ||= "start_date ASC"
        return paginate(:all, :per_page => 20, :page => page, :order => order)
    end
    
end
