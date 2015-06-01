desc "fetch the food trucks every night"
task :fetcher => :environment do
  TruckFetcher.new.get_food_trucks
end
