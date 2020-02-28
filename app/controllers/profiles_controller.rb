class ProfilesController < ApplicationController
  before_action :get_user, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
  end

  def selected_user_posts
    @posts = Post.where(user_id: params[:id])
    render 'posts/index'
  end

  private
  def get_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user.nil?
  end
end
