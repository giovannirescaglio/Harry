class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    @project = @user.projects.last
    @admin = @project.user
    mail(to: @user.email, subject: "You're invited to join a project on Harry")
  end
end
