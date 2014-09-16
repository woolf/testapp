class CategoriesController < ApplicationController
  before_filter :require_logged_in_user

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params.require(:category).permit(:name))
    if @category.valid?
      flash[:notice] = "Category created"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params.require(:category).permit(:name))
      flash[:notice] = "Category updated"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category deleted"
    else
      flash[:notice] = "Can't delete category. Monuments assigned to this category exists?"
    end
    redirect_to categories_path
  end
end
