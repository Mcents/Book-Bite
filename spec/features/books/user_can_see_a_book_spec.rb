require 'rails_helper'

RSpec.feature "User can see an individual book" do
  scenario "and is able to borrow a book" do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) 
  category = create(:category)
  book = create(:book, user_id: user.id, category_id: category.id)

  visit book_path(book)

  expect(page).to have_content(book.title)
  expect(page).to have_content(book.author)

  end
end
