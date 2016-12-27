class Api::V1::ExpensesController < ApplicationController
  before_filter :restrict_access

  def index
    expenses = Expense.all.where(trip_id: params[:trip_id])
    render json: expenses
  end

  def show
    expense = Expense.find(params[:id])
    render json: expense
  end

  private
    def restrict_access
      employee = Employee.find_by(email: params[:email])
      head :unauthorized unless employee && employee.api_token == params[:api_token]
    end
end

