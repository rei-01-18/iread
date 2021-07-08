class BooksController < ApplicationController
  before_action :set_book, only: [:destroy]

  def index
    @books = Book.all 
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :date, :next)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
