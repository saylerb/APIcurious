class SessionsController < ActionController::Base
  def create
   if params["code"]
    authenticator = RedditAuthService.new(params["code"])
    res = authenticator.token_response

    case res
    when Net::HTTPSuccess
      access_token = authenticator.access_token
      flash[:notice] = "Sucessfully Authenticated"
      session[:access_token] = access_token
      render text: res.body.inspect + " Code: " + params["code"]
    else
      res.value
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end

   else
     flash[:error] = "Code not present"
     redirect_to root_path
   end
    
    # Could create a user in the database to store tokens
    # When they login, it updates that token
    # Move this code out of the controller
  end
end
