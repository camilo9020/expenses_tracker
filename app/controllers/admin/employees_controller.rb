class Admin::EmployeesController < ApplicationController

  before_action :authenticate_employee!

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    is_resend = true
    raw_token, hashed_token = Devise.token_generator.generate(Employee, :reset_password_token)
    @employee = Employee.where(email: params[:email]).take
    if @employee
      @employee.update(reset_password_token: hashed_token,
          reset_password_sent_at: Time.now.utc)
    else
      @employee = Employee.new(employee_params.merge(password: Devise.friendly_token,
          reset_password_token: hashed_token,
          reset_password_sent_at: Time.now.utc))
      if @employee.save
        is_resend = false
      else
        render :new
      end
    end
    if @employee.valid?
      EmployeeMailer.invite_new_employee(current_employee, @employee, raw_token).deliver_now
      notice = is_resend ? "Se ha notificado al empleado del cambio exitosamente" : "El empleado ha sido creado y notificado exitosamente"
      flash[:success] = notice
      redirect_to admin_employees_path
    end

  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update

  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:sucess] = 'The employee was deleted successfully'
    redirect_to admin_employees_path
  end

private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :occupation, :admin)
  end
end
