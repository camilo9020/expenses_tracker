# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  destiny     :string
#  begin_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
