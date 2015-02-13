class UserMailer < ApplicationMailer
  default from: 'notifications@localhost.com'

  def comment_email(user, comment)
    @user = user
    @comment = comment
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: "Comment Notification")
  end

  def assignment_user_comment_email(assignment, comment)
    @comment = comment
    @assignment = assignment
    mail(to: assignment.user.email, subject: "Comment Notification")
  end

  def submission_user_comment_email(submission, comment)
    @comment = comment
    @submission = submission
    mail(to: submission.user.email, subject: "Comment Notification")
  end


end
