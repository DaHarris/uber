class Api::DocumentationController < ApplicationController
  before_action :authenticate

  def home

  end

  private

  def authenticate
    if !current_user
      redirect_to signin_path
    end
  end
end
