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
    book_user = User.find_or_create_by(name: review_params[:user].downcase.titlecase)
    Review.create(title: title, description: description, rating: rating, book: book, user: book_user)
    redirect_to book_path(book)
  end

  def destroy
    review = Review.find(params[:id])
    user = review.user
    review.destroy

    redirect_to user_path(user.id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :user)
  end
end