class Admin::CategoriesController < ApplicationController
  before_action :authenticate_employee!

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

  def destroy
    @category =  Category.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
