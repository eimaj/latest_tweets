module LatestTweets
  class TwitterTimeline
    attr_accessor :options, :client

    def initialize(options)
      @client = config_twitter
      @options = default_options.merge(options)
      if (@options[:account] && @options[:query]) || (!@options[:account] && !@options[:query])
        raise "You must supply :account OR :query"
      end
    end

    def tweets
      if options[:account]
        client.user_timeline(options[:account], count: options[:count])
      elsif options[:query]
        client.search(options[:query], count: options[:count]).to_a
      end
    end

    private
      def default_options
        {count: 3}
      end

      def config_twitter
        @client = TwitterSetup.config
      end
  end
end
