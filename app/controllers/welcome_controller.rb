class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
  end
  def location
    session[:latitude] = params[:latitude]
    session[:longitude] = params[:longitude]
    render nothing: true, status: 200
  end
  def results
    @location = [session[:latitude], session[:longitude]]
    @restaurant = Restaurant.near([session[:latitude], session[:longitude]], 0.25, :order => 'distance asc').paginate(:page => params[:page], :per_page => 10)
    if @restaurant.any? == false
      flash[:alert] = "You are currently not within the required distance to review."
    end
  end
  def search
    if params[:search].present?
      @results = Restaurant.search(params[:search], fields: [:name], page: params[:page], :per_page => 10)
      # @results.each do |x|
      #   x.yelp_call
      # end
    else
      @results = Restaurant.all.paginate(:page => params[:page], :per_page => 10)
    end
    end
  end
