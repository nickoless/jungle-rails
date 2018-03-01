class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(email)

    mail(to: email, subject: 'Confirmation of Order')
  end
end
