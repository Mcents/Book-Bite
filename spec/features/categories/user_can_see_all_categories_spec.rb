require 'rails_helper'

RSpec.feature "User cans see all categories" do
  scenario "and can not edit or delete them" do
  
  user = create(:user)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  category = create(:category)

  visit categories_path

  expect(page).to have_content(category.title) 
  end
end
