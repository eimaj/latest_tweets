module TwitterSetup
  class << self
    def config(config = config_from_environment_variables)
      Twitter::REST::Client.new(config)
    end

    private def config_from_environment_variables
      {
        :consumer_key => ENV['TWITTER_CONSUMER_KEY'],
        :consumer_secret => ENV['TWITTER_CONSUMER_SECRET'],
        :access_token => ENV['TWITTER_ACCESS_TOKEN'],
        :access_token_secret => ENV['TWITTER_ACCESS_TOKEN_SECRET']
      }
    end
  end
end
