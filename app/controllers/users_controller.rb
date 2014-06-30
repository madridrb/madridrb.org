class UsersController < ApplicationController
  respond_to :html

  helper_method :user

  def index
    @users = User.by_email.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)

    if @user.save
      login @user
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    user.update_attributes(edit_user_params)
    respond_with user
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def create_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:name, :email, :about, :url, :twitter)
  end

end
