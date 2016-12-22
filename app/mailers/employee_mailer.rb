class EmployeeMailer < ApplicationMailer
  def invite_new_employee(invited_by, employee, token)
    @invited_by = invited_by
    @employee = employee
    @token = token
    mail(to: employee.email, subject: "Haz sido invitado a la aplicación Expenses tracker")
  end

  # def new_question(employee, question)
  #   @employee = employee
  #   @question = question
  #   mail(to: employee.email, subject: "Nueva pregunta en #{employee.account.name} - #{question.knowledge_base.name}")
  # end

  # def new_answer(employee, answer)
  #   @employee = employee
  #   @answer = answer
  #   mail(to: employee.email, subject: "Nueva respuesta a la pregunta #{answer.question.title}")
  # end
end
