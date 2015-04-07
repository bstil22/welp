class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all.paginate(:page => params[:page], :per_page => 10)
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
