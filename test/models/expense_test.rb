# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  trip_id     :integer
#  description :string
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
