require 'rails_helper'
require 'factory'

describe 'User can signin' do

  before :each do
    FactoryGirl.create(:user)
    visit '/'
    click_on "API"
  end

  it 'can see signin validations with no input' do
    click_on "Sign In"

    expect(page).to have_content("Incorrect Login Credentials.")
  end

  it 'can see signin validations with incorrect data' do
    fill_in "Email", with: "coolguy@coolguy.net"
    fill_in "Password", with: "wrong"
    click_on "Sign In"

    expect(page).to have_content("Incorrect Login Credentials.")
  end

  it 'can signin with correct credentials' do
    fill_in "Email", with: "coolguy@coolguy.net"
    fill_in "Password", with: "stuff"
    click_on "Sign In"

    expect(page).to have_content("Signout coolguy@coolguy.net")
  end
end
