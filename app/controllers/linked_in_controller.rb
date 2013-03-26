require 'linkedin'

class LinkedInController < ApplicationController 
  
  def login

    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new(APP_CONFIG[:linkedin_api_key], APP_CONFIG[:linkein_secret_key], APP_CONFIG[:linkedin_client_options])
    request_token = client.request_token(:oauth_callback =>
                                      "http://#{request.host_with_port}/linked_in/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url

  end

  def callback
      
    client = LinkedIn::Client.new(APP_CONFIG[:linkedin_api_key], APP_CONFIG[:linkein_secret_key], APP_CONFIG[:linkedin_client_options])
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    
    @profile = client.network_updates(:type => 'SHAR')
    #@share = client.add_share(:comment => 'new share API')
    
    render "index"
  end
end

