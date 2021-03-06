class Admin::CategoriesController < ApplicationController
  before_action :authenticate_employee!
  before_filter :authorized?

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def edit
    @category =  Category.find(params[:id])
  end

  def update
    @category =  Category.find(params[:id])
    @category.update(category_params)
  end

  def destroy
    @category =  Category.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
