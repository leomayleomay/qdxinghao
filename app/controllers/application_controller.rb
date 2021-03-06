# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging :password, :password_confirmation

  before_filter :get_basic_info

  add_crumb "首页", "/home"

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "您无权进行此项操作."
    redirect_to home_url
  end

  private
  def get_basic_info
    @basic_info ||= BasicInfo.first
  end
end
