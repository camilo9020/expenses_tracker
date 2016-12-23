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

class Expense < ApplicationRecord
  belongs_to :trip
end
