class BookmarksController < ApplicationController

  helper_method :book_id
  before_action :prepare_book, only: [:index, :new, :create]
  before_action :prepare_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = @book.bookmarks
    flash.now[:alert] = 'No bookmark found' if @bookmarks.empty?
  end

  def show
    @book = @bookmark.book
  end

  def new
    @bookmark = @book.bookmarks.build
  end

  def create
    # byebug
    @bookmark = @book.bookmarks.build(bookmark_params)
    if @bookmark.save
      flash[:notice] = 'Bookmark created successfully'
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end

  def edit
    @book = @bookmark.book
  end

  def update
    if @bookmark.update(bookmark_params)
      flash[:notice] = 'Bookmark saved successfully'
      redirect_to bookmark_path(@bookmark)
    else
      render :edit
    end
  end

  def destroy
    @book = @bookmark.book
    @bookmark.destroy
    flash[:notice] = 'Bookmark deleted successfully'
    redirect_to book_bookmarks_path(@book)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:page_number, :description)
  end

  def prepare_book
    @book = Book.find(params[:book_id])
  end

  def prepare_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

end
