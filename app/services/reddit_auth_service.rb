class RedditAuthService
  attr_reader :token_response, :access_token
  def initialize(code)
    @token_response = get_token_response(code)
    @access_token = get_access_token
  end

  def get_token_response(code)
    uri = URI('https://www.reddit.com/api/v1/access_token')

    res = Net::HTTP.start(uri.hostname, uri.port,
            use_ssl: uri.scheme == "https") do |http|
      req = Net::HTTP::Post.new(uri)
      req.set_form_data(token_params(code))
      req.basic_auth ENV["REDDIT_KEY"], ENV["REDDIT_SECRET"]
      http.request(req)
    end
  end

  def get_access_token
    JSON.parse(@token_response.body, symbolize_names: true)
  end
  
  private

  def token_params(code)
    { "grant_type" => "authorization_code", 
      "code" => code, 
      "redirect_uri" => "http://localhost:3000/auth/reddit/callback",
      "Content-Type" => "application/x-www-form-urlencoded"
    }
  end
end
