class BooksController < ApplicationController
  before_action :set_book, only: [:destroy]

  def index
    @books = Book.all 
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
    @book = Book.find(params[:id])
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
