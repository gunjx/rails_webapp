class UserMailer < ApplicationMailer
  default from: "spannagel.andreas@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'spannagel.andreas@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = 'HipsterFoods'
    mail(to: user.email, subject: "Welcome to #{@appname}!")
  end
end
