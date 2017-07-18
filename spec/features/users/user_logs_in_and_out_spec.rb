require 'rails_helper'

RSpec.feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "michaelc"
      password: "mypassword"
    }

    user = User.create(user_attributes)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "session[password]", with: user_attributes[:password]
    click_on "Log in"
end
