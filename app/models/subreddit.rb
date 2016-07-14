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

end

