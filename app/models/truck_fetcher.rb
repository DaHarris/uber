class TruckFetcher

  def initialize
    @url = "https://data.sfgov.org/resource/rqzj-sfat.json"
    @conn = Faraday.new(:url => @url) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_food_trucks
    response = @conn.get
    save_data(JSON.parse(response.body))
  end

  def save_data(data)
    data.each do |truck|
      puts truck["applicant"]
    end
  end
end
