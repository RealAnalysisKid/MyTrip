class CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.where(:is_hidden => false)
  end

  def show
    @city = City.find(params[:id])
    @posts = @city.posts.where(:is_hidden => false)

    if @city.is_hidden && @city.user != current_user
      flash[:warning] = "抱歉 您没有权限查看此文档"
      redirect_to root_path
    end
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.user = current_user
    if @city.save
      redirect_to cities_path
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
      redirect_to cities_path, notice: "City Updated"
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path, alert: "City Deleted"
  end

  private

  def city_params
    params.require(:city).permit(:title, :description, :is_hidden)
  end

end
