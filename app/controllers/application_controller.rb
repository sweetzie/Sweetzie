# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  #before_filter :ensure_domain

  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #THE_DOMAIN = "http://sweetzie.com"

  # def ensure_domain
  #     if request.env['HTTP_HOST'] != THE_DOMAIN
  #       redirect_to THE_DOMAIN
  #     end
  #   end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
