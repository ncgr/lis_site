
class NewsArticle < ActiveRecord::Base
  paginates_per 20
  
  validates_presence_of :title, :body
end
