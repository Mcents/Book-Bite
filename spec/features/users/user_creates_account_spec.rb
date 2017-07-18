require 'rails_helper'

feature "User creates an account" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "michaelc",
      password: "mypassword",
      first_name: "michael",
      last_name: "centrelli"
    }

    visit "users/new"
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[first_name]", with: user_attributes[:first_name]
    fill_in "user[last_name]", with: user_attributes[:last_name]
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
