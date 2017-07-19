require 'rails_helper'

RSpec.feature "User can create a book" do
  scenario "when they are logged in" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(title: "Education")
    book_jacket = "http://bookcoverarchive.com/wp-content/uploads/amazon/the_stranger.jpg"

    visit "books/new"
    fill_in "book[title]", with: "The Sun Also Rises"
    fill_in "book[author]", with: "Ernest"
    fill_in "book[isbn]", with: "9729479274"
    select "Education", from: "book_category_id"
    click_button "Create Book"

    l_book = Book.last

    expect(current_path).to eq(book_path(l_book))
    expect(page).to have_content(l_book.title)
    expect(page).to have_content(l_book.author)
    expect(page).to have_content(l_book.isbn)
  end
end
