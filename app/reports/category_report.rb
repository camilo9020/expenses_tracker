class CategoryReport < Prawn::Document

  def initialize(categories, n)
    super()
    @categories = categories
    @n = n
    report_head
    categories_table
    footer
  end

  def report_head
    text "Top #{@n} categories with bigger expenses", size: 25, style: :bold, color: '#A9A9A9'
  end

  def categories_table
    move_down 20
    table line_expenses_rows, width: bounds.width do
      row(0).font_style = :bold
    end
  end

  def line_expenses_rows
    [["Category", "Total expenses"]] +
    @categories.sort_by{|k,v| v}.reverse.to_h.first(@n).map do |key, value|
      [key, value]
    end
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
