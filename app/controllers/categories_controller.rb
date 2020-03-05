class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :category_all_posts ]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категория успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Категория успешно удалена'
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to @category, success: 'Категория успешно обновлена'
    else
      flash[:danger] = 'Категория не обновлена'
      render :edit
    end
  end

  def category_all_posts
    @posts = Post.where(category_id: @category.id)
    render 'posts/index'
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
    if @category.nil?
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
