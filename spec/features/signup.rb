require 'rails_helper'
require 'factory'

describe 'User can signup' do

  before :each do
    visit '/'
    click_on "API"
    click_on "Signup"
  end

  it 'can see signup validations' do
    click_on "Create User"

    expect(page).to have_content("There were errors on the page:")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Email can't be blank")
  end

  it 'validates that emails are unique' do
    FactoryGirl.create(:user)

    fill_in "Email", with: "coolguy@coolguy.net"
    fill_in "Password", with: "stuff"
    click_on "Create User"

    expect(page).to have_content("There were errors on the page:")
    expect(page).to have_content("Email has already been taken")
  end
end
