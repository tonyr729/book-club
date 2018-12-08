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
    user = User.create(name: review_params[:user])
    Review.create!(title: title, description: description, rating: rating, book: book, user: user)
    
    redirect_to book_path(book)
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :user)
  end
end