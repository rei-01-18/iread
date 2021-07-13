class UsersController < ApplicationController

  def show
    @book = Book.order("RAND()").limit(2)
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).order(created_at: :desc).limit(10)
    if @likes.exists?
      like = @likes.last
      book = like.book
      @category_recommend = Book.where(category_id: book.category_id)
    end
  end
end
