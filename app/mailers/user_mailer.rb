class UserMailer < ApplicationMailer
  def welcome(user, project)
    @user = user
    @project = project
    @admin = @project.user
    mail(to: @user.email, subject: "You're invited to join a project on Harry")
  end
end
