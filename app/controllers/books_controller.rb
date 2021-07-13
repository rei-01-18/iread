class BooksController < ApplicationController
  before_action :set_book, only: [:destroy, :show]

  def index
    @books = Book.order("created_at DESC")
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @book.comments
    @comment = Comment.new
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  def search
    @books = Book.search(params[:keyword])
    render :index
  end

  def category
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :date, :next, :review, :radio, :category_id).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
