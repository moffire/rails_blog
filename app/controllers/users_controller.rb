class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def show
  end


  private
  def get_user
    @user = User.find_by(params[:id])
    redirect_to root_path if @user.nil?
  end
end
