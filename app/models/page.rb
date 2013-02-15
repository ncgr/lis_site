class Page < ActiveRecord::Base
  paginates_per 20
  belongs_to :user

  SORTABLE_COLUMNS = ["title", "updated_at"]
  DEFAULT_ORDER    = "title ASC"

  attr_accessible :body
end
