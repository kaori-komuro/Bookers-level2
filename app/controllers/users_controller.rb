class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
    @books = Book.all
    @book = Book.new
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
     @user = User.find(params[:id])
  end

  def destroy
      @book = Book.find(params[:id])
      redirect_to new_book_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

private
def user_params
    params.require(:user).permit(:name, :profile_image)
end

end