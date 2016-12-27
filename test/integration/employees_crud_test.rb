require 'test_helper'

class EmployeesCrudTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = false

  test 'admin employee can create a new employee' do
    sign_in employees(:juan)
    visit new_admin_employee_path
    fill_in 'employee_first_name', with: 'Santiago'
    fill_in 'employee_last_name', with: 'Ramirez'
    fill_in 'employee_email', with: 'santiago@prueba.com'
    fill_in 'employee_occupation', with: 'Analist'
    click_button 'Save'
    assert page.has_content? 'El empleado ha sido creado y notificado exitosamente'
  end


end
