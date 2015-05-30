class SampleController < ApplicationController

  def index
    @tweets = TweetFetcher.new.get_tweets
  end
end
