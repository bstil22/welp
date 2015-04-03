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
    @restaurant = Restaurant.near([session[:latitude], session[:longitude]], 0.25)
  end
end