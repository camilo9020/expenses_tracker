class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  private
    def authorized?
      if !current_employee.admin?
        flash[:danger] = "You should be an admin to sign in in that area"
        redirect_to root_path
      end
    end

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) do |employee_params|
       employee_params.permit :first_name, :last_name, :occupation, :email, :admin, :password, :password_confirmation
     end
   end
end
