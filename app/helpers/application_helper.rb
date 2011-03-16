# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
    ##
    # Date / Time helper.
    #
    def display_time(timestamp)
        return nil if timestamp.blank?
        return timestamp.strftime("%a, %b %d %Y, %H:%M")
    end
    
    ##
    # Date helper.
    #
    def display_date(date)
        return date.strftime("%b %d, %Y")
    end
    
    ##
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
        return date
    end
    
end
