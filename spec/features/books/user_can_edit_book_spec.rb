require 'rails_helper'

RSpec.feature "User can edit a book" do
  scenario "and it will update" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = create(:category)
    book = Book.create(title: "Not Sick", author: "That one guy", isbn: "748297489724", category_id: category.id, user_id: user.id)
    updated_title = "Sick"

    visit book_path(book)
    click_on "Edit"
    fill_in "book[title]", with: updated_title
    fill_in "book[author]", with: book.author
    fill_in "book[isbn]", with: book.isbn
    select "Education", from: "book_category_id"
    click_on "Update"

    expect(page).to have_content(updated_title)
    expect(page).to have_content(book.author)
   
  end
end
