class Api::V1::ServeController < ApplicationController

  def all
    @food_trucks = FoodTruck.all
    render json: @food_trucks
  end
end
