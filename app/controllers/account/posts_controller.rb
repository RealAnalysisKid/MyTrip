class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def show
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
  end
end
