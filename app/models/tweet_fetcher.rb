class TweetFetcher

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def get_tweets
    tweets = @client.list_timeline(URI.parse('https://twitter.com/MobileCravings/sf-food-trucks'))
  end
end
# puts crap[0].user.screen_name
# puts crap[0].text
# puts crap[0].id
# puts crap[0].user.profile_background_image_url_https
