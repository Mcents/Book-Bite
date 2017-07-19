require 'rails_helper'

RSpec.feature "User creates a new category" do
  scenario "a user can create a new category" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    title = "Education"

    visit new_category_path
    fill_in "category[title]", with: title
    click_button "Create Category"

    expect(page).to have_content("Education")
  end
end
