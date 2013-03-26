class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def linkedin      
    client = LinkedIn::Client.new(APP_CONFIG[:linkedin_api_key], APP_CONFIG[:linkein_secret_key], APP_CONFIG[:linkedin_client_options])

    client.authorize_from_access(APP_CONFIG[:linkedin_atoken], APP_CONFIG[:linkedin_asecret])
    
    client
    
  end
  
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end
 
  private
  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end
  
end
