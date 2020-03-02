class ProfilesController < ApplicationController
  before_action :get_user, only: [:show, :subscribe, :unsubscribe]

  def show
    @user = User.find_by(id: params[:id])
  end

  def selected_user_posts
    @posts = Post.where(user_id: params[:id])
    render 'posts/index'
  end

  def subscribe
    if @user.id != current_user.id
      if current_user.subscriptions.exists?(friend_id: @user)
        redirect_to root_path, notice: "Вы уже подписаны на пользователя #{@user.name}"
      else
        subscription = current_user.subscriptions.new
        subscription.friend_id = @user.id
        subscription.save
        if subscription.save
          redirect_to profile_path(@user), notice: "Вы успешно подписались на пользователя #{@user.name}"
        end
      end
    else
      redirect_to root_path
    end
  end

  def unsubscribe
    if @user.id != current_user.id
      if current_user.subscriptions.exists?(friend_id: @user)
        subscription = current_user.subscriptions.find_by(friend_id: @user)
        subscription.destroy
        redirect_to profile_path(@user), notice: "Вы успешно отписались от пользователя #{@user.name}"
      else
        redirect_to profile_path(@user), notice: "Вы не подписаны на пользователя #{@user.name}"
      end
    else
      redirect_to root_path
    end
  end

  def friends_posts
    @posts = Post.where(user_id: current_user.subscriptions.pluck(:friend_id))
    render 'posts/index'
  end

  private
  def get_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user.nil?
  end
end
