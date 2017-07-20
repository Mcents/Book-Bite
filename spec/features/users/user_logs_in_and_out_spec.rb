require 'rails_helper'

feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "michaelc",
      password: "mypassword"
    }

    user = User.create(user_attributes)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "session[password]", with: user_attributes[:password]
    click_on "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successful login")

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("{user.username}")
  end
end
