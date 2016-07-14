class RedditService

  def get_user_data(access_token)
    uri = URI("https://oauth.reddit.com/api/v1/me")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = Net::HTTP::Get.new(uri.request_uri)
    res.initialize_http_header({"User-Agent" => "apicurious",
                                "Authorization" => "bearer #{access_token}"})
    result = http.request(res)
    parse(result)
  end

  def get_subscriptions(access_token)
    uri = URI("https://oauth.reddit.com/subreddits/mine/subscriber?limit=100")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = Net::HTTP::Get.new(uri.request_uri)
    res.initialize_http_header({"User-Agent" => "apicurious",
                                "Authorization" => "bearer #{access_token}"})
    result = http.request(res)
    parse(result)
  end

  def get_subreddit_info(access_token, subreddit_name)
    uri = URI("https://oauth.reddit.com/r/#{subreddit_name}/about")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = Net::HTTP::Get.new(uri.request_uri)
    res.initialize_http_header({"User-Agent" => "apicurious",
                                "Authorization" => "bearer #{access_token}"})
    result = http.request(res)
    parse(result)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

# def self.get_user_data(access_token)
#     uri = URI("https://oauth.reddit.com/api/v1/me")
# 
#     http = Net::HTTP.new(uri.host, uri.port)
#     http.use_ssl = true
# 
#     res = Net::HTTP::Get.new(uri.request_uri)
#     res.initialize_http_header({"User-Agent" => "apicurious",
#                                 "Authorization" => "bearer #{access_token}"})
#     result = http.request(res)
#     parse(result)
#   end
# 
#   def self.parse(response)
#     JSON.parse(response.body)
#   end
# 
