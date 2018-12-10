class UsersController < ApplicationController
  def show
    if params[:sort_dir]
      @user = User.find(params[:id])
      @reviews = @user.sort_reviews_by_date(params[:sort_dir])
    else
      @user = User.find(params[:id])
      @reviews = @user.reviews
    end
  end
end