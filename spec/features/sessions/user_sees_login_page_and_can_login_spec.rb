require 'rails_helper'

RSpec.feature "unauthenticated user can login" do 
  scenario "and is directed to the books index" do
    user = User.create(username: "mcents", password: "thepassword")
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
 
    visit login_path

    fill_in "session[username]", with: "mcents"
    fill_in "session[password]", with: "thepassword"
    click_on "Login"

    expect(page).to have_content("Books")

  end
end
