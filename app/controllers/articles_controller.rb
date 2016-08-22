class ArticlesController < ApplicationController

  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_category, only: [:new, :create, :edit, :show, :destroy]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = @category.articles.new(article_params)
    if @article.save
      redirect_to action: 'show', id: @article.id
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to action: 'show', id: @article.id
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to category_path(@category)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :price, :user_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
