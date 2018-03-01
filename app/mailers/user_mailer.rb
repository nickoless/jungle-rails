class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(email, order)
    @order = order
    mail(to: email, subject: "Confirmation of Order #{order.id}")
  end
end