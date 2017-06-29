class BooksController < ApplicationController
  def index
    @books = Book.index
  end
  
  def my_books
    @books = current_user.books
    render 'index'
  end

  def show
    @book = Book.index.find_by_id(params[:id])
    @book ||= current_user.books.find(params[:id])
  end

  def new
    @book = current_user.books.build
  end
  
  def create
    @book = current_user.books.build(books_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
    @book = current_user.books.find(params[:id])
  end
  
  def update
    @book = current_user.books.find(params[:id])
    if @book.update(books_params)
      redirect_to @book
    else
      render 'edit'
    end
  end
  
  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def books_params
    params.require(:book).permit(:title, :description, :author, :tag_list, :cover, :cover_cache, :published)
  end
end
