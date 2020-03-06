class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!
  before_action :owner, only: [:edit, :destroy, :update]

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
    @categories = Category.all
  end

  def show
    if @post.nil?
      redirect_to posts_path
    else
      @post.views += 1
      @post.save
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья успешно удалена'
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Статья успешно обновлена'
    else
      flash[:danger] = 'Статья не обновлена'
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end

  def owner
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: 'У вас нет прав на редактирование данной статьи' if @post.nil?
  end

end

