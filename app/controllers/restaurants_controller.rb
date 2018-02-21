class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index #DONE
    @restaurants = Restaurant.all
  end

  def show #DONE
  end

  def new #DONE
    @restaurant = Restaurant.new
  end

  def create #DONE
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit #DONE
    @restaurant = Restaurant.find(params[:id])
  end

  def update #DONE
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy #DONE
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
