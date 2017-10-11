class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @has_read = @book.hasRead
  end

  def create
    Book.create(book_params.merge(hasRead: params[:hasRead]))
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params.merge(hasRead: params[:hasRead]))
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author)
  end

end
