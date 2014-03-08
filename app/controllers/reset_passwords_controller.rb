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
  end

  def update
  end

  private

  def deliver_email(user)
    UserMailer.reset_password(user).deliver
  end

end
