class UserMailer < ApplicationMailer
  default from: 'notifications@localhost.com'

  def comment_email(user, comment)
    @greeting = "Hi"
    @user = user
    @comment = comment
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: "Comment Notification")
  end
end
