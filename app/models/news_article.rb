#
# NewsArticle Model
# 
# Author: Ken Seal - NCGR
#

class NewsArticle < ActiveRecord::Base
  
  paginates_per 20
  
end
