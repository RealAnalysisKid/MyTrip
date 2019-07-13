class Admin::CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_is_required

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @posts = @city.posts
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.user = current_user
    if @city.save
      redirect_to admin_cities_path
    else
      render :new
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      redirect_to admin_cities_path, notice: "City Updated"
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to admin_cities_path, alert: "City Deleted"
  end

  private

  def city_params
    params.require(:city).permit(:title, :description, :is_hidden)
  end
end
