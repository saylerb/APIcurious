Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['REDDIT_KEY'], ENV['REDDIT_SECRET'], 
    duration: "temporary",
    scope: "identity,subscribe,vote,submit,history,read,mysubreddits"
end
#
   #  grant_type: "authorization_code",
   #  redirect_uri: "http://127.0.0.1:3000/auth/reddit/callback"

