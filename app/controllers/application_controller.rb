class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def linkedin      
    client = LinkedIn::Client.new(APP_CONFIG[:linkedin_api_key], APP_CONFIG[:linkein_secret_key], APP_CONFIG[:linkedin_client_options])

    client.authorize_from_access(APP_CONFIG[:linkedin_atoken], APP_CONFIG[:linkedin_asecret])
    
    client
    
  end
  
end
