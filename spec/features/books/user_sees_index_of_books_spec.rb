require 'rails_helper'

RSpec.feature "User can see index of all books" do
  scenario "and click through to the show page" do
     user = User.create(username: "test user", password: "ghewog68")
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

     category = Category.create(title: "Science")
     book = Book.create(title: "This is a book", author: "Person man", isbn: 9379075932, category_id: category.id, user_id: user.id) 
 
    
    visit books_path
    save_and_open_page
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
  end
end
