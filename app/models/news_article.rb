##
# NewsArticle Model
# 
# Author: Ken Seal - NCGR
#

class NewsArticle < ActiveRecord::Base
    
    def self.get_recent_news(limit = nil)
        limit ||= 1
        return find(:all, :order => "timestamp DESC", :limit => limit)
    end
    
    def self.paginate_by_params(page, order = nil)
        order ||= "timestamp DESC"
        return paginate(:all, :per_page => 20, :page => page, :order => order)
    end
    
end
