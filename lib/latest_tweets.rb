require 'twitter'
require 'latest_tweets/version'
require 'latest_tweets/twitter_setup'
require 'latest_tweets/twitter_timeline'

module LatestTweets
  def self.from_account(account, count = 3)
    LatestTweets::TwitterTimeline.new({account: account, count: count}).tweets
  end

  def self.from_query(query, count = 3)
    LatestTweets::TwitterTimeline.new({query: query, count: count}).tweets
  end
end
