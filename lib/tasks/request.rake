desc "reset user api request count every night"
task :request => :environment do
  User.all.each do |user|
    user.update_attribute("api_requests",0)
  end
end
