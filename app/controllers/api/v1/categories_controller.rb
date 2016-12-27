class Api::V1::CategoriesController < ApplicationController
  before_filter :restrict_access
  skip_before_filter  :verify_authenticity_token

  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category, status: 200
    else
      render json: category.errors, status: 422
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    head :no_content
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def restrict_access
      employee = Employee.find_by(email: params[:email])
      head :unauthorized unless employee && employee.api_token == params[:api_token] && employee.admin?
    end
end