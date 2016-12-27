class Api::V1::EmployeesController < ApplicationController
  before_filter :restrict_access

  def index
    employees = Employee.all
    render json: employees
  end

  def show
    employee = Employee.find(params[:id])
    render json: employee
  end

  private
    def restrict_access
      employee = Employee.find_by(email: params[:email])
      head :unauthorized unless employee && employee.api_token == params[:api_token] && employee.admin?
    end
end