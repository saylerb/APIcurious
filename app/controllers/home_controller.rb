class HomeController < ApplicationController
  def index
    @access_token = session[:access_token]
    # access_token = "q2d9IQJDib7obzilQ6knrV1DNe0"
    @user = User.user_data(@access_token)
    @subreddits = Subreddit.all(@access_token)
  end
end
