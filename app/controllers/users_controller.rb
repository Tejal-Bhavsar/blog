class UsersController < ApplicationController
  before_action :authenticate_user!, except: :create
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      UserMailer.with(user: @user).welcome_email.deliver_now
      redirect_to(articles_path, notice: "User was successfully created.")
    else
      redirect_to(new_user_registration_path, notice: @user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_created_at, :updated_at, :name, :last_seen_at)
  end
end
