require 'spec_helper'

feature 'Reset password' do

  background do
    recreate! :user
    clear_emails
    @user = create :user, email: 'user@sample.com', password: 'Fake1234'

    visit '/session/new'
    click_link 'Forgot your password?'
    fill_in :email, with: 'user@sample.com'
    click_button 'Request'

    open_email 'user@sample.com'
    current_email.click_link 'Reset password'
  end

  scenario 'Enter password correctly' do
    fill_in 'Password', with: 'NewPassword'
    fill_in 'Password confirmation', with: 'NewPassword'
    click_button 'Update'
    should_see "You're now logged"
  end

  scenario 'Enter wrong password' do
    fill_in 'Password', with: 'NewPassword'
    fill_in 'Password confirmation', with: 'WrongPassword'
    click_button 'Update'
    should_see "Reset Password"
  end

end
