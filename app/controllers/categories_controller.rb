class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def show
  end

  def new
    @category = Category.new  
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      flash[:warning] = "Category was failed to create!"
      render 'new'
    end
  end
  def edit
  end

  def delete
  end
  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
