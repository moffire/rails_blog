class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    if @post.nil?
      redirect_to posts_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body)
  end

end

