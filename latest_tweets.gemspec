# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'latest_tweets/version'

Gem::Specification.new do |spec|
  spec.name          = "latest_tweets"
  spec.version       = LatestTweets::VERSION
  spec.authors       = ["Jamie Allen"]
  spec.email         = ["jamie@factore.ca"]
  spec.summary       = %q{Fetch the latest tweets from your twitter account and display them in your app.}
  spec.description   = %q{Fetch the latest tweets from your twitter account and display them in your app.}
  spec.homepage      = "https://github.com/eimaj/latest_tweets"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*")
  # spec.files         = ["lib/latest_tweets.rb", "lib/latest_tweets/initializers/twitter.rb", "lib/latest_tweets/twitter_timeline.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"

  spec.add_dependency "twitter", "~> 5.7"
  # spec.add_dependency "twitter-text", "~> 1.7"
end
