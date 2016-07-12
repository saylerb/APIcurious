Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['REDDIT_KEY'], ENV['REDDIT_SECRET'], 
    scope: "identity,subscribe,vote,submit,history,read,mysubreddits"
end
#
   #  duration: "temporary",
   #  grant_type: "authorization_code",
   #  redirect_uri: "http://127.0.0.1:3000/auth/reddit/callback"

