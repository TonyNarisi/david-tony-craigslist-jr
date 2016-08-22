class CategoriesController < ApplicationController

  before_action :require_user, only: [:new, :create, :destroy]
  before_action :find_category, only: [:show, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @articles = @category.articles
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
