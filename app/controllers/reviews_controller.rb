class ReviewsController < ApplicationController
    before_action :authenticate_visitor!
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params[:review].permit(:title, :body, :rating))

    @review.restaurant = @restaurant
    @review.user = current_user
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.update(params[:review].permit(:title, :body, :rating))

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.destroy
    redirect_to restaurant_path(@restaurant)
  end
private

  def review_params
    params.require(:review).permit(
    :title, :body, :rating, :restaurant_id, :user_id)
  end

end