class Api::V1::ServeController < ApplicationController

  def all
    @user = User.find_by_api_key(params[:api_key])
    if @user
      @user.increment!(:api_requests)
      render json: FoodTruck.all
    else
      render json: {:error => "Incorrect or unregistered API Key request."}
    end
  end

end
