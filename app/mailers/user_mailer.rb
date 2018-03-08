class UserMailer < ApplicationMailer
  default from: "spannagel.andreas@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'spannagel.andreas@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
