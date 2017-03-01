require 'rails_helper'

RSpec.describe Tweet do
    
    it 'new tweet object' do
        tweet_params = Hash.new
        tweet_params[:user]      = "Bruno"
        tweet_params[:url]       = "www.twitter.com.br"
        tweet_params[:followers] = 1
        tweet_params[:retweets]  = 2
        tweet_params[:likes]     = 3
        tweet_params[:text]      = "New Tweet Object"
        tweet_params[:date]      = "Tue Fev 28 10:00:00 +0000 2017"

        tweet = Tweet.new(tweet_params)
        
        expect(tweet.user).to eq "Bruno"
        expect(tweet.url).to eq "www.twitter.com.br"
        expect(tweet.followers).to eq 1
        expect(tweet.retweets).to eq 2
        expect(tweet.likes).to eq 3
        expect(tweet.text).to eq "New Tweet Object"
        expect(tweet.date).to eq "Tue Fev 28 10:00:00 +0000 2017"
    end
end