#
# Temp fix to remove the nasty rack warning messages.
# The messages will go away if we upgrade to rack 1.3.
#
module Rack                    
  module Utils                 
    def escape(s)              
      CGI.escape(s.to_s)       
    end                        
    def unescape(s)            
      CGI.unescape(s)          
    end
  end
end

