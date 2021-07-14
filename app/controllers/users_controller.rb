class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @title = current_user.books
    @book = Book.order("RAND()").limit(2)
    @users = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @users.id).order(created_at: :desc).limit(10)
    if @likes.exists?
      like = @likes.last
      book = like.book
      @category_recommend = Book.where(category_id: book.category_id)
    end
  end
end
