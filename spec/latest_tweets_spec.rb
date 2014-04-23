require 'spec_helper'

describe LatestTweets do
  let(:twitter_timeline) { double.as_null_object }

  context '.from_account' do
    it 'passes the account to LatestTweets::TwitterTimeline' do
      allow(LatestTweets::TwitterTimeline).to receive(:new) do |params|
        expect(params[:account]).to eq('eimaj')
        twitter_timeline
      end
      LatestTweets.from_account('eimaj')
    end

    it 'passes the count, if provided, to LatestTweets::TwitterTimeline' do
      allow(LatestTweets::TwitterTimeline).to receive(:new) do |params|
        expect(params[:count]).to eq(1)
        twitter_timeline
      end
      LatestTweets.from_account('eimaj', 1)
    end

    it 'grabs the tweets' do
      allow(LatestTweets::TwitterTimeline).to receive(:new) { twitter_timeline }
      expect(twitter_timeline).to receive(:tweets)
      LatestTweets.from_account('eimaj')
    end
  end

  context '.from_query' do
    it 'passes the query to LatestTweets::TwitterTimeline' do
      allow(LatestTweets::TwitterTimeline).to receive(:new) do |params|
        expect(params[:query]).to eq('#HamOnt')
        twitter_timeline
      end
      LatestTweets.from_query('#HamOnt')
    end

    it 'passes the count, if provided, to LatestTweets::TwitterTimeline' do
      allow(LatestTweets::TwitterTimeline).to receive(:new) do |params|
        expect(params[:count]).to eq(1)
        twitter_timeline
      end
      LatestTweets.from_query('#HamOnt', 1)
    end

    it 'grabs the tweets' do
      allow(LatestTweets::TwitterTimeline).to receive(:new) { twitter_timeline }
      expect(twitter_timeline).to receive(:tweets)
      LatestTweets.from_query('eimaj')
    end
  end
end
