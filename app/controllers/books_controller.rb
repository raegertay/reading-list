class BooksController < ApplicationController

  helper_method :sort_column, :sort_direction, :search_params

  def index
    # byebug
    @books = if sort_column
               Book.search(search_params).order(sort_column + ' ' + sort_direction)
             elsif search_params
               Book.search(search_params).order(:name, :author)
             else
               Book.all.order(:name, :author)
             end
    flash[:alert] = 'Book not found'
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book added succesfully'
      # byebug
      redirect_to books_path
    else
      render :new
      # byebug
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # byebug
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book updated succesfully'
      redirect_to books_path
    else
      # byebug
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book deleted succesfully'
    redirect_to books_path
  end

  private

  # Return book attributes in hash format
  def book_params
    params.require(:book).permit(:name, :author, :has_read)
  end

  # Return search term if exists, otherwise return nil
  def search_params
    params.dig(:search, :term)
  end

  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : nil
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : nil
  end

end
