class Subreddit < OpenStruct

  def self.service
    @@service ||= RedditService.new
  end

  def self.all(access_token)
    data = service.get_subscriptions(access_token)
    
    data[:data][:children].map do |subreddit|
      Subreddit.new(subreddit[:data])
    end
  end

  def self.find(access_token, subreddit_name)
    data = service.get_subreddit_info(access_token, subreddit_name)

    sub = Subreddit.new(data[:data])
  end

end

