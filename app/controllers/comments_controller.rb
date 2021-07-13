class CommentsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]

  def create
    @comment = @book.comments.new(comment_params)
    if @comment.save
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to book_path(@book)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(book_id: params[:book_id], user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

end
