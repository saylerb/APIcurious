class SessionsController < ApplicationController
  def create
    code = params["code"]

    uri = URI('https://www.reddit.com/api/v1/access_token')
    #data = "grant_type=authorization_code&code=#{code}&redirect_uri=http://localhost:3000/auth/reddit/callback"

    data = { grant_type: "authorization_code", 
             code: code, 
             redirect_uri: "http://localhost:3000/auth/reddit/callback"
           }

    req = Net::HTTP::Post.new(uri, data)

    req.basic_auth ENV["REDDIT_KEY"], ENV["REDDIT_SECRET"]

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
      http.request(req)
    end
    res.body

    binding.pry
    render text: res.body.inspect

  end
end
