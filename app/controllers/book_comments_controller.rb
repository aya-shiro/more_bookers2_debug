class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book_comment = BookComment.find_by(params[:id])
    book_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
