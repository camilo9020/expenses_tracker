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

class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :category
end
