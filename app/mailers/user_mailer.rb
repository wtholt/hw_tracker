class UserMailer < ApplicationMailer
  default from: 'notifications@localhost.com'

  def comment_email(user)
    @greeting = "Hi"
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: "Comment Notification")
  end
end
