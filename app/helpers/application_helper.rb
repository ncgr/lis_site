# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
    ##
    # Date / Time helper.
    #
    def display_time(timestamp)
        return nil if timestamp.blank?
        return timestamp.strftime("%a, %b %d %Y, %H:%M")
    end
    
end
