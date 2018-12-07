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


  def create
    book_params[:title] = book_params[:title].downcase.titlecase
    final_params = Author.sanitize_authors_input(book_params)
    @book = Book.new(final_params)
    @book.save
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :publication_year, :authors)
  end


end
