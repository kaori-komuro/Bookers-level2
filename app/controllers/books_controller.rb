class BooksController < ApplicationController
before_action :authenticate_user!,
 only: [:index, :show, :new, :create, :update, :edit, :destroy, :update]

  def index
    @books = Book.all
    @book = Book.new
    @user = User.all
  end

  def about
  end

  def show
    @book_params = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
    @user = User.all
    @users = @book_params.user
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
        @books = Book.all
        @user = User.all
        render :index
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to book_path(@book.id)
  end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end

  end