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
      food_truck.json = truck
      food_truck.name = truck["applicant"]
      food_truck.location_description = truck["locationdescription"]
      food_truck.schedule = truck["schedule"]
      food_truck.location = truck["address"]
      food_truck.location_id = truck["objectid"]
      food_truck.food = truck["fooditems"].gsub!(':',',') if truck["fooditems"]
      location = get_latlng(food_truck.location) if food_truck.location
      if location
        food_truck.latitude = location[0].latitude
        food_truck.longitude = location[0].longitude
      end
      if food_truck.valid?
        food_truck.save
      end
    end
  end

  def get_latlng(address)
    address += ", san francisco, california"
    #add sleep function to not hit per second query limit
    sleep(0.25)
    return Geocoder.search(address)
  end
end
