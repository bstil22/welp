class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to results_path
    else
      redirect_to signin_path
    end
  end

  def coordinates
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
    else
      @results = Restaurant.all.paginate(:page => params[:page], :per_page => 10)
    end
  end
end
