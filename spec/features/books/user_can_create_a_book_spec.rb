# require 'rails_helper'
#
# RSpec.feature "User can create a book" do
#   scenario "with valid attributes" do
#     book_jacket = "http://bookcoverarchive.com/wp-content/uploads/amazon/the_stranger.jpg"
#
#     visit "books/new"
#     fill_in "book[title]", with: "The Sun Also Rises"
#     fill_in "book[author]", with: "Ernest"
#     fill_in "book[jacket]", with: book_jacket
#     fill_in "book[isbn]", with: "9729479274"
#     click_button "Create Book"
#
#     l_book = Book.last
#
#     expect(current_path).to eq(book_path(l_book))
#     expect(page).to have_content(l_book.title)
#     expect(page).to have_content(l_book.author)
#     expect(page).to have_content(l_book.isbn)
#   end
# end
