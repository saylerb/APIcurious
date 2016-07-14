class SessionsController < ActionController::Base
  def create
   if params["code"]
    authenticator = RedditAuthService.new(params["code"])
    @res = authenticator.token_response

    case @res
    when Net::HTTPSuccess
      access_token = authenticator.access_token
      flash.now[:notice] = "Sucessfully Authenticated"
      session[:access_token] = access_token
      redirect_to root_path
    else
      flash.now[:error] = "#{@res.body} Something went wrong"
      redirect_to root_path
    end

   else
     flash.now[:error] = "Code not present"
     redirect_to root_path
   end
  end
end
