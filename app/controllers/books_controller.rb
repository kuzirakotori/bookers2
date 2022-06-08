class BooksController < ApplicationController
  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
    @users = current_user
    @book_comment = BookComment.new
    @book_comments = BookComment.where(book_id: params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book=Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end