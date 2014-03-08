class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password(user)
    @user = user
    mail to: @user.email,
         subject: 'Reset Password'
  end
end
