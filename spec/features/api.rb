require 'rails_helper'
require 'factory'

RSpec.describe Api::V1::ServeController, type: :controller do

  before :each do
    @user = FactoryGirl.create(:user)
    @foodTruck = FactoryGirl.create(:food_truck)
  end

  it "Throws an error without correct api_key" do
    get "all"
    expect(response.body).to include('{"error":"Incorrect or unregistered API Key request."}')
  end

  it "Gives the food trucks with correct credentials" do
    get "all", {:api_key => @user.api_key}
    expect(response.body).to eq([@foodTruck].to_json)
  end

end
