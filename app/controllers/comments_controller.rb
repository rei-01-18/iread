class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.Comment.find_by(params[:id])
    redirect_to book_path(book.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(book_id: params[:book_id])
  end

end
