require 'spec_helper'

describe LatestTweets::TwitterTimeline do
  let(:twitter_client) { double.as_null_object }

  context 'when provided a username' do
    let(:twitter_timeline) { LatestTweets::TwitterTimeline.new(account: 'eimaj') }

    context '#tweets' do
      it 'looks up by username' do
        allow(twitter_timeline).to receive(:client) { twitter_client }
        allow(twitter_client).to receive(:user_timeline) do |query, params|
          expect(query).to eq('eimaj')
          [ ]
        end
        twitter_timeline.tweets
      end
    end

    context 'when provided a count' do
      let(:twitter_timeline) { LatestTweets::TwitterTimeline.new(account: '#HamOnt', count: 1) }

      context '#tweets' do
        it 'passes the count along' do
          allow(twitter_timeline).to receive(:client) { twitter_client }
          allow(twitter_client).to receive(:search) do |query, params|
            expect(params[:count]).to eq(1)
            [ ]
          end
          twitter_timeline.tweets
        end
      end
    end

    context 'when told to exclude replies' do
      let(:twitter_timeline) { LatestTweets::TwitterTimeline.new(account: '#HamOnt', count: 1, exclude_replies: true) }

      context '#tweets' do
        it 'passes that option along' do
          allow(twitter_timeline).to receive(:client) { twitter_client }
          allow(twitter_client).to receive(:search) do |query, params|
            expect(params[:exclude_replies]).to eq(true)
            [ ]
          end
          twitter_timeline.tweets
        end
      end
    end
  end

  context 'when provided a query' do
    let(:twitter_timeline) { LatestTweets::TwitterTimeline.new(query: '#HamOnt') }

    context '#tweets' do
      it 'looks up by query' do
        allow(twitter_timeline).to receive(:client) { twitter_client }
        allow(twitter_client).to receive(:search) do |query, params|
          expect(query).to eq('#HamOnt')
          [ ]
        end
        twitter_timeline.tweets
      end
    end

    context 'when provided a count' do
      let(:twitter_timeline) { LatestTweets::TwitterTimeline.new(query: '#HamOnt', count: 1) }

      context '#tweets' do
        it 'passes the count along' do
          allow(twitter_timeline).to receive(:client) { twitter_client }
          allow(twitter_client).to receive(:search) do |query, params|
            expect(params[:count]).to eq(1)
            [ ]
          end
          twitter_timeline.tweets
        end
      end
    end
  end

  context 'when not provided a username or query' do
    let(:twitter_timeline) { LatestTweets::TwitterTimeline.new }

    it 'doesnt take that shit' do
      expect { twitter_timeline }.to raise_error
    end
  end
end
