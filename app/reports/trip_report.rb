class TripReport < Prawn::Document

  def initialize(trip)
    super()
    @user = trip.employee
    @trip = trip
    report_head
    expenses_table
    totals
    footer
  end

  def report_head
    text "Trip to #{@trip.destiny} of #{@user.first_name} #{@user.last_name}", size: 25, style: :bold, color: '#A9A9A9'
    text "Occupation: #{@user.occupation}", size:20, style: :bold, color: '#A9A9A9'
    move_down 10
    text "Begin date: #{@trip.begin_date}", size: 15, style: :bold
    text "End date: #{@trip.end_date}", size: 15, style: :bold
  end

  def expenses_table
    move_down 20
    table line_expenses_rows, width: bounds.width do
      row(0).font_style = :bold
    end
  end

  def line_expenses_rows
    [["Description", "Category", "Amount"]] +
    @trip.expenses.map do |expense|
      [expense.description, expense.category.name, expense.amount]
    end
  end

  def totals
    move_down 20
    text "Total expenses: #{@trip.expenses.sum(:amount)} USD", size: 18, style: :bold, align: :right
  end

  def footer
    bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
       font "Helvetica"
       stroke_horizontal_rule
       move_down(5)
       text "Expenses Tracker Report - #{Time.now.strftime('%m/%d/%Y')}", :size => 16
    end
  end

end