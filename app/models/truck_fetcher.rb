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
      food_truck = FoodTruck.new
      food_truck.name = truck["applicant"]
      food_truck.location_description = truck["locationdescription"]
      food_truck.schedule = truck["schedule"]
      food_truck.location = truck["address"]
      food_truck.food = truck["fooditems"]
    end
  end
end
