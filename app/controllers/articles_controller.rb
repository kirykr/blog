class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
  @articles = Article.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    # debugger
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "The Article has been create successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @article.update(article_params)
      flash[:success] = "The Article has been updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end 
  def delete
  end

  def destroy

    @article.destroy

    flash[:danger]  = "Article #{ @article.title } has been deleted!"
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :user_id, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can ony edit or delete your own articles!"
      redirect_to root_path
    end
  end

end
