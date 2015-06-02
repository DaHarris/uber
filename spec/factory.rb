FactoryGirl.define do

  factory :truck do
    name "Grillenium Falcon"
    location_description "in the Kessel Run"
    schedule "http://ham.solo"
    location "The Maw"
    food "womp rats"
    location_id "1"
    json "{:success => {'whoa'}}"
    longitude "13"
    latitude "37"
  end

  factory :user do
    email "coolguy@coolguy.net"
    password "stuff"
    api_key "1234"
    api_requests "1"
  end
end
