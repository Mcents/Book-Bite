require 'slack-notify'

class BooksController < ApplicationController

  def new
    @book = Book.new
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
    @pages = Book.paginate(page: params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def send_to
    # @user = current_user
    # notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    # notifier.ping at-kevin.mugele "Someone wants to borrow your book"
    client = SlackNotify::Client.new(webhook_url: "https://hooks.slack.com/services/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", username: "book-borrow-bot")
    client.notify("Someone wants to borrow your book", "@kevin.mugele")
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "You updated #{@book.title}"
      flash[:notice] = "Contact this person"

      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :jacket, :isbn, :borrowed, :category_id, :user_id)
  end




end
