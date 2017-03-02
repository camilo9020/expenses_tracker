class ExpensesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @expenses = Expense.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.save
    flash[:success] = nil #probar
  end

  def destroy
    @expense =  Expense.find(params[:id])
    @expense.destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :amount, :tags, :trip_id, :category_id)
  end

end
