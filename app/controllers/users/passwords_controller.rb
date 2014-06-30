class Users::PasswordsController < ApplicationController

  helper_method :user

  def edit
  end

  def update
    if current_user.update_password(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
