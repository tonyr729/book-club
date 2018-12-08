class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    title = review_params[:title]
    description = review_params[:description]
    rating = review_params[:rating]
    book = Book.find(params[:book_id])
    book_user = User.new(name: review_params[:user].downcase.titlecase)
    book_user.save
    if book_user.save
      Review.create(title: title, description: description, rating: rating, book: book, user: book_user)

      redirect_to book_path(book)
    else
      @book_user = book_user
      @book = Book.find(params[:book_id])
      @review = Review.new
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :user)
  end
end