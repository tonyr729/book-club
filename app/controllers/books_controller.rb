class BooksController < ApplicationController
  def index
    if params[:pages_param]
      @books = Book.order("#{params[:pages_param]} #{params[:sort_dir]}")
    elsif params[:review_param]
      @books = Book.order_by_reviews_count(params[:sort_dir])
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_path
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
