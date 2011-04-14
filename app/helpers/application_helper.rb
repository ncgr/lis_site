module ApplicationHelper
  
  #
  # Insert page title
  #
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  #
  # Date / Time helper.
  #
  def display_time(timestamp)
    return nil if timestamp.blank?
    timestamp.strftime("%a, %b %d %Y, %H:%M")
  end
  
  #
  # Date helper.
  #
  def display_date(date)
    date.strftime("%b %d, %Y")
  end
  
  #
  # Start end date helper.
  #
  def format_start_end_date(s_date, e_date = nil)
    if e_date.nil?
      return dislpay_date(s_date)
    end
    if (s_date.mon == e_date.mon) && (s_date.year == e_date.year)
      date = s_date.strftime("%b %d-").to_s + e_date.strftime("%d, %Y").to_s
    elsif s_date.year == e_date.year
      date = s_date.strftime("%b %d - ").to_s + e_date.strftime("%b %d, %Y").to_s
    end
      date
  end
  
end
