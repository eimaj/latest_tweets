# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'latest_tweets/version'

Gem::Specification.new do |spec|
  spec.name          = "latest_tweets"
  spec.version       = LatestTweets::VERSION
  spec.authors       = ["Jamie Allen", "Sean Roberts", "Devlin Zed"]
  spec.email         = ["jamie@factore.ca"]
  spec.summary       = %q{Simple twitter gem wrapper for grabbing the latest tweets from an account or query.}
  spec.description   = %q{Simple twitter gem wrapper for grabbing the latest tweets from an account or query.}
  spec.homepage      = "https://github.com/eimaj/latest_tweets"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"

  spec.add_dependency "twitter", "~> 5.7"
end
