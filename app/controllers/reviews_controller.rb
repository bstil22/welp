class ReviewsController < ApplicationController
  before_action :authenticate_visitor!
  before_action :can_review, only: [:new, :create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)

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
    @reviews.update(review_params)

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.find(params[:id])
    @reviews.destroy
    redirect_to restaurant_path(@restaurant)
  end

  def can_review
    @restaurant = Restaurant.find(params[:restaurant_id])
    if Restaurant.near([session[:latitude], session[:longitude]], 0.25).include?(@restaurant)
      puts "nice you can review this"
    else
      redirect_to root_path, alert: "You are currently not within the required distance to review."
    end
  end

  private

  def review_params
    params.require(:review).permit(
    :title, :body, :rating, :restaurant_id, :user_id, :photo)
  end
end
