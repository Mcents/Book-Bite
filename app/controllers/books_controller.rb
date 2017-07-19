class BooksController < ApplicationController

  def new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :jacket, :isbn, :borrowed)
  end




end
