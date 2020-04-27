class UserMailer < ApplicationMailer
  default from: "tejalbhavsar02@gmail.com"

  def welcome_email
    @user = params[:user]
    @url = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, subject: "Welcome to My Awesome blog Site")
  end
end
