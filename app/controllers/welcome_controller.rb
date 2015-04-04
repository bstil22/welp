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
      if @restaurant.any?
        puts "************************we can review"
      else
        flash[:notice] = "you are not within the required distance"
      end
  end
  def search
    if params[:search].present?
      @results = Restaurant.search(params[:search], fields: [:name], params[:page], :per_page => 10)
    else
      @results = Restaurant.all.paginate(:page => params[:page], :per_page => 10)
    end
    
  end

end