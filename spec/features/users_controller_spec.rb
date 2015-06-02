require 'rails_helper'
require 'factory'

RSpec.describe UsersController, type: :controller do

  before :each do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  it "Creates a User with #Post" do
    expect(User.last.email).to eq("coolguy@coolguy.net")
  end

  it "Creates an API key for users with #Post" do
    expect(User.last.api_key).to eq("1234")
  end

  it "Redirects to the API documentation" do
    post :create, user: {:email => "a@a.a", :password => "whoa"}
    expect(response).to redirect_to("/documentation")
  end

end
