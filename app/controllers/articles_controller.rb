class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_param)
    if @article.save
      flash[:notice] = "The Article has been create successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @article.update(article_param)
      flash[:notice] = "The Article has been updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end 
  def delete
  end

  def destroy

    @article.destroy

    flash[:notice]  = "Article #{ @article.title } has been deleted!"
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :description)
  end
end
