class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
  end

  def edit
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
  end

  def create
    @city = City.find(params[:city_id])
    @post = Post.new(post_params)
    @post.city = @city
    @post.user = current_user

    if @post.save
      redirect_to city_path(@city)
    else
      render :new
    end
  end

  def update
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to city_path(@city), notice:"Post Updated"
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to city_path(@city), alert:"Post Deleted"
  end



  private

  def post_params
    params.require(:post).permit(:address, :price, :reason, :necessity, :reservation, :best_time, :created_at, :is_hidden)
  end
end
