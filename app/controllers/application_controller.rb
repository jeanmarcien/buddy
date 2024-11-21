class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  helper_method :page_name
  
  private
  
  def page_name
    controller_name = controller_path.gsub('/', '_')
    "#{controller_name}_#{action_name}"
  end
end
