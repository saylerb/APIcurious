class User < OpenStruct

  def self.service
    @@service ||= RedditService.new
  end

  def self.user_data(access_token)
    data = service.get_user_data(access_token)
    User.new(data)
  end

end

