class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_is_required
  layout "admin"

  def show
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
  end

  def create
    @city = City.find(params[:city_id])
    @post = Post.new(post_params)
    @post.city = @city
    @post.user = current_user

    if @post.save
      redirect_to admin_city_path(@city)
    else
      render :new
    end
  end

  def edit
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
  end

  def update
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_city_path(@city), notice: "Post Updated"
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_city_path(@city), alert: "Post Deleted"
  end

  def publish
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
    @post.publish!
    redirect_to :back
  end

  def hide
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
    @post.hide!
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:address, :reason, :price, :necessity, :reservation, :best_time, :is_hidden)
  end
end
