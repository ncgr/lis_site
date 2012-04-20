
class Meeting < ActiveRecord::Base
  paginates_per 20
  SORTABLE_COLUMNS = ["title", "start_date", "end_date"]
  DEFAULT_ORDER    = "start_date ASC"

  validates_presence_of :title, :url, :start_date, :end_date
end
