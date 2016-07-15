class SessionsController < ActionController::Base
  def create
   if params["code"]
    authenticator = RedditAuthService.new(params["code"])
    @res = authenticator.token_response

    case @res
    when Net::HTTPSuccess
      access_token = authenticator.access_token
      flash[:notice] = "Sucessfully Authenticated!!!"
      session[:access_token] = access_token
      redirect_to root_path
    else
      flash[:error] = "Oops, something went wrong: #{@res.message}"
      redirect_to root_path
    end

   else
     flash.now[:error] = "Error"
     redirect_to root_path
   end
  end
end
