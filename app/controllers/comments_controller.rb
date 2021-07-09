class CommentsController < ApplicationController
  before_action :set_book

  def create
    @comment = @book.Comment.create(comment_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to book_path(@book)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(book_id: params[:book_id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

end
