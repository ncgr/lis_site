# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    helper :all 
    protect_from_forgery
    rescue_from ActionView::MissingTemplate, :with => :render_missing_template

    ##
    # Override render_optional_error_file to display our custom error pages using
    # our default layout.
    #
    # @param Int status_code
    #
    protected
    def render_optional_error_file(status_code)
        status = interpret_status(status_code)
        render :template => "/errors/#{status[0,3]}.html.erb", :status => status, :layout => 'default.html.erb'
    end
    
    ##
    # Override render_missing_template to display our custom 404 error page.
    # I am only doing this to accomidate our static pages in app/pages/. See
    # routes.rb and app/controllers/pages_controller.rb for more information. 
    #
    protected
    def render_missing_template
        render :template => "/errors/404.html.erb", :layout => 'default.html.erb'
    end

end
