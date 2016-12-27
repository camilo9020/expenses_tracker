require 'test_helper'

class TripsCrudTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = false
  test 'admin employee can create a Trip' do
    sign_in employees(:juan)
    visit new_trip_path
    fill_in 'trip_destiny', with: 'Madrid'
    fill_in 'trip_begin_date', with: '01/12/2016'
    fill_in 'trip_end_date', with: '15/12/2016'
    select employees(:juan).email, from: 'trip_employee_id'
    click_button 'Save'
    page.has_content? "The trip was created successfully and the employee was notificated"
  end

end
