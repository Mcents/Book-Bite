require 'rails_helper'

feature "User can create a book" do
  scenario "with valid attributes" do
    book = build(:book)
    book_jacket = "http://bookcoverarchive.com/wp-content/uploads/amazon/the_stranger.jpg"

    visit "books/new"
    fill_in "book[title]", with: book.title
    fill_in "book[author]", with: book.author
    fill_in "book[jacket]", with: book_jacket
    fill_in "book[isbn]", with: book.isbn
    click_on "Create Book"

    new_book = Book.last


    expect(current_path).to eq(book_path(new_book))
    expect(page).to have_content(new_book.title)
    expect(page).to have_content(new_book.author)
    expect(page).to have_content(new_book.isbn)
  end
end
