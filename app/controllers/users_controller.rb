class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.all
    @users = User.find(params[:id])
    @books = @users.books.page(params[:page])
    @book = Book.new
  end

  def index
    @user = User.all
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
        redirect_to books_path
      end
  end

  def edit
     @user = User.find(params[:id])
      if @user.id != current_user.id
      redirect_to users_path
    end
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "introduction was successfully edited."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private
def user_params
    params.require(:user).permit(:user, :username, :profile_image, :introduction)
end

end