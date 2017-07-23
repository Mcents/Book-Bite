require 'rails_helper'

RSpec.feature "An unauthenticated user can sign up" do 
  scenario "and be redirected to the home page to sign in" do 

  visit new_user_path
  fill_in "user[username]", with: "mcents"
  fill_in "user[password]", with: "gihegiehg"
  fill_in "user[first_name]", with: "bob"
  fill_in "user[last_name]", with: "jones"
  click_on "Create Account"

  expect(page).to have_content("Book Bite")
  end
end

