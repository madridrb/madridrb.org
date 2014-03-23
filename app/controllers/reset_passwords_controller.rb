class ResetPasswordsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      user.forgot_password!
      deliver_email(user)
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_confirmation_token!(params[:id])
  end

  def update
    @user = User.find_by_confirmation_token!(params[:id])

    if @user.update_password(password_params)
      login @user
      redirect_to root_url, notice: "You're now logged"
    else
      render :edit
    end
  end

  private

  def deliver_email(user)
    UserMailer.reset_password(user).deliver
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
