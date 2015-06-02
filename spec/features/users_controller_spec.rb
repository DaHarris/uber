require 'rails_helper'
require 'factory'

RSpec.describe UsersController, type: :controller do

  before :each do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  it "Creates a User with #Post" do
    expect(User.last.email).to eq("dan@harris.com")
  end

  it "Creates an API key for users with #Post" do
    expect(User.last.api_key).to eq("1234")
  end

end
