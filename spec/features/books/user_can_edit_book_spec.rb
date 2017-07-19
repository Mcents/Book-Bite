require 'rails_helper'

RSpec.feature "User can edit a book" do
  scenario "and it will update" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(title: "Education")
    book = create(:book, category_id: 1, user_id: 1)

    visit book_path
    save_and_open_page
    click_on "Edit"
    fill_in "book[title]", with: book.title
    fill_in "book[author]", with: book.author
    fill_in "book[isbn]", with: book.isbn
    select "Education", from: "book_category_id"
    click_on "Update"

    expect(page).to have_content(book.title)

  end
end
