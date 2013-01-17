
class NewsArticle < ActiveRecord::Base
  paginates_per 20

  attr_accessible :title, :body

  validates_presence_of :title, :body
end
