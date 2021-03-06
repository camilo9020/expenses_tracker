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
class Trip < ApplicationRecord
  belongs_to :employee
  has_many :expenses
  validates :employee_id, :destiny, :begin_date, :end_date, presence: true
end
