class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all(current_token)
  end

  def show
    subreddit_name = params[:subreddit_name]
    @subreddit = Subreddit.find(current_token, subreddit_name)
  end
end
