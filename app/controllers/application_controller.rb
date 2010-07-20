# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    helper :all 
    protect_from_forgery
    rescue_from ActionView::MissingTemplate, :with => :render_missing_template

    protected
    def render_optional_error_file(status_code)
        status = interpret_status(status_code)
        render :template => "/errors/#{status[0,3]}.html.erb", :status => status, :layout => 'default.html.erb'
    end
    
    def render_missing_template
        render :template => "/errors/404.html.erb", :layout => 'default.html.erb'
    end

end
