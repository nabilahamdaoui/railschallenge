class NotificationMailer < ApplicationMailer

  def notify(email, message)
    @message = message
    mail(:to => email, :subject => message)
  end

end
