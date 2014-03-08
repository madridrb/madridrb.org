require 'spec_helper'

feature 'Reset password' do

  background do
    recreate! :user
    clear_emails
    @user = create :user, email: 'user@sample.com', password: 'Fake1234'
  end

  scenario 'A non-logged-in user request reset a password' do
    visit '/session/new'
    click_link 'Forgot your password?'
    fill_in :email, with: 'user@sample.com'
    click_button 'Request'

    open_email 'user@sample.com'
    current_email.click_link 'Reset password'
    fill_in :password, with: 'NewPassword'
    fill_in :password_confirmation, with: 'NewPassword'
    click_button 'Update'
  end

end
