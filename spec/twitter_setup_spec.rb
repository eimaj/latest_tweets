require 'spec_helper'

describe TwitterSetup do
  context '.config' do
    let(:client) { TwitterSetup.config }

    it 'returns an object that responds to user_timeline' do
      expect(client).to respond_to(:user_timeline)
    end

    it 'returns an object that responds to search' do
      expect(client).to respond_to(:search)
    end

    context 'when passed options' do
      let(:client) { TwitterSetup.config(:consumer_key => 'fart') }

      it 'internalizes them' do
        expect(client.consumer_key).to eq('fart')
      end
    end

    context 'when not passed any options' do
      it 'read environment variables' do
        expect(client.consumer_key).to eq(ENV['TWITTER_CONSUMER_KEY'])
      end 
    end
  end
end
