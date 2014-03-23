class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      login user
      redirect_to root_url, notice: "You're logged"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'See you soon!'
  end

end
