# LatestTweets

Fetch the latest tweets from your twitter account and display them in your app.

## Installation

Add this line to your application's Gemfile:

    gem 'latest_tweets'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install latest_tweets

## Usage

    require 'twitter'
    require 'latest_tweets'

### Set the following environment variables:

    ENV['TWITTER_CONSUMER_KEY']        = ''
    ENV['TWITTER_CONSUMER_SECRET']     = ''
    ENV['TWITTER_ACCESS_TOKEN']        = ''
    ENV['TWITTER_ACCESS_TOKEN_SECRET'] = ''

## Contributing

1. Fork it ( http://github.com/<my-github-username>/latest_tweets/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
