class SampleController < ApplicationController

  def index
    @tweets = TweetFetcher.new.get_tweets
  end

  def sample
    url = request.env["HTTP_REFERER"]
    if url == "http://foodtruckin.herokuapp.com/"
      render json: FoodTruck.all
    else
      render json: { :error => "Use /api/v1/all for all api requests."}
    end
  end
end
