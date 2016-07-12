class SessionsController < ApplicationController
  def create
    code = params["code"]

    uri = URI('https://www.reddit.com/api/v1/access_token')
    req = Net::HTTP::Post.new(uri)
    req.basic_auth ENV["REDDIT_KEY"], ENV["REDDIT_SECRET"]
    req.body = "grant_type=authorization_code&code=#{code}&redirect_uri=http://localhost:3000/auth/reddit/callback"
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
      http.request(req)
    end
    res.body

    render text: res.body.inspect

  end
end
