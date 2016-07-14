class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_token

  def current_token
    if token_override
      return token_override
    else
      return current_token = session[:access_token]
    end
  end

  def token_override
    #"oxpF8oPjdP8ZTg5-Rge9Fg_1zXo"
    #"RZCAPwr6n4yYNuPVeT8Ezs9Ae2E"
    #"9AmC0Y3-LdZXuGxGulPd0wvGoSI"
  end

end
