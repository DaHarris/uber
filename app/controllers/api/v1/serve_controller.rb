class Api::V1::ServeController < ApplicationController

  def all
    @user = User.find_by_api_key(params[:api_key])
    if @user
      if @user.api_requests > 1000
        render json: {:error => "You have exceeded your 1000 requests per day limit."}
      else
        @user.increment!(:api_requests)
        render json: FoodTruck.all
      end
    else
      render json: {:error => "Incorrect or unregistered API Key request."}
    end
  end

end
