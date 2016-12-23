# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  trip_id     :integer
#  description :string
#  amount      :decimal(, )
#  tags        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
