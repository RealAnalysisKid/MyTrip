class Account::CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = current_user.cities
  end

  def show
    @city = City.find(params[:id])
    @post = current_user.posts
  end
end
