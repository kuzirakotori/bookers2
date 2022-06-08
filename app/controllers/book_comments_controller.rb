class BookCommentsController < ApplicationController
  def create
    @books = Book.find(params[:book_id])
    comment = current_user.book_comments.new(post_comment_params)
    comment.book_id = @books.id
    comment.save
    @book_comment = BookComment.new
    @book_comments = BookComment.where(book_id: params[:id])
    @user = @books.user
  end

  def destroy
    comment=BookComment.find(params[:book_id])
    comment.destroy
    @books = Book.find(params[:book_id])
    @book_comment = BookComment.new
    @book_comments = BookComment.where(book_id: params[:id])
    @user = @books.user
  end

  private

  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
