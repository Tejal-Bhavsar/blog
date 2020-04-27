class UserMailer < ApplicationMailer
  default from: "tejalbhavsar02@gmail.com"

  def welcome_email
    @user = params[:user]
    @url = ENV["app_url"]/users/sign_in"
    mail(to: @user.email, subject: "Welcome to My Awesome blog Site")
  end
end
