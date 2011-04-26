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
    timestamp.to_s(:date_time_long)
  end
  
  #
  # Date helper.
  #
  def display_date(date)
    date.to_s(:short_date_no_time)
  end
  
  #
  # Start and end date helper.
  #
  def format_start_end_date(s_date, e_date = nil)
    
    return dislpay_date(s_date) if e_date.nil?

    # Format the dates based on month and year.
    if (s_date.mon == e_date.mon) && (s_date.year == e_date.year)
      date = s_date.strftime("%b %d-").to_s + e_date.strftime("%d, %Y").to_s
    elsif s_date.year == e_date.year
      date = s_date.strftime("%b %d - ").to_s + e_date.strftime("%b %d, %Y").to_s
    else
      date = s_date.strftime("%b %d, %Y - ").to_s + e_date.strftime("%b %d, %Y").to_s
    end
      date
  end
  
  #
  # Sortable column helper.
  #
  def kaminari_sort_by(path, title, col = nil)
    if (!path.respond_to? :to_sym) && (!title.kind_of? String)
      raise ArgumentError, "kaminari_sort_by expects path to be a Symbol and title to be a String."
    end
    
    # Set col
    col.nil? ? col = title.downcase.gsub(' ', '_') : col = col
    
    # Set the default direction param.
    params[:dir].nil? ? params[:dir] = "desc" : params[:dir]
    
    # Sort direction
    dir = (params[:dir].downcase == "desc") ? "asc" : "desc"
    
    if params[:dir] && col == params[:sort]
        up = " <img src=/images/up_arrow.png alt="" />"
        down = " <img src=/images/down_arrow.png alt="" />"
        title = (dir == "desc") ? title + up : title + down
    end
    
    # Sort options - :page must be passed along for pagination to work properly.
    options = {:sort => col, :dir => dir, :page => params[:page]}
    
    return link_to raw(title), self.send(path, options)
  end
  
end
