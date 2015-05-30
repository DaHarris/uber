class Api::V1::ServeController < ApplicationController

  def all
    render json: FoodTruck.all
  end

end
