require 'rails_helper'

RSpec.feature "User can delete a book" do
  scenario "only when they are the owner of the book" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) 
    category = create(:category)
    book = Book.create(title: "This is a book", author: "Ernest Hemingway", isbn: "3920859038", category_id: category.id, user_id: user.id)

    visit book_path(book)
    click_on 'Delete'

    expect(page).to_not have_content(book.title)
    expect(page).to_not have_content(book.author)
  end
end
