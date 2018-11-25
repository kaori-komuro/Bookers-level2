class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def about
  end

  def show
  end

  def new
    @books = Book.all
    @book = Book.new
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @user = current_user
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
      else
        render("/books/new")
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to new_book_path
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to new_book_path
  end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end