class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    if category.save
      flash[:success] = "#{category.title} added!"
      redirect_to category_path(category)
    else
      flash[:notice] = "Title has already been taken!"
      redirect_to new_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    if category.save
      flash[:success] = "Category updated!"
      redirect_to category_path(category)
    else
      flash[:notice] = "Title already exists!"
      redirect_to edit_category_path(category)
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to categories_path
    flash.notice = "Category deleted!"
  end

  private
    def category_params
      params.require(:category).permit(:title)
    end
end
