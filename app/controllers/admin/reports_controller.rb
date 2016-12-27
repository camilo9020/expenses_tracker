class Admin::ReportsController < ApplicationController

  before_action :authenticate_employee!
  before_filter :authorized?

  def trip_report
    @trip = Trip.find(params[:id])
    @expenses = @trip.expenses.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TripReport.new(current_employee, @trip)
        send_data pdf.render, filename: "#{@trip.destiny + '_' + current_employee.first_name + current_employee.last_name +  @trip.begin_date.to_s }to#{@trip.end_date.to_s}",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def category_report
    if params[:n].present?
      @categories = Category.all
      @totals_by_category = {}
      @categories.each do |category|
        @totals_by_category[category.name] = category.expenses.sum(:amount).to_f
      end
      respond_to do |format|
        format.html
        format.pdf do
          pdf = CategoryReport.new(@totals_by_category, params[:n].to_i)
          send_data pdf.render, filename: "Categroy Report at #{Time.now.strftime('%m/%d/%Y')}",
                                type: "application/pdf",
                                disposition: "inline"
        end
      end
      else
      flash[:danger] = "You should input the number of categories to rank."
      redirect_to admin_categories_path
    end
  end
end
