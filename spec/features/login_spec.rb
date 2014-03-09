require 'spec_helper'

feature 'Login' do

  background do
    recreate! :user
    @user = create :user, email: 'user@sample.com', password: 'Fake1234'
  end

  scenario 'A user login successfully' do
    visit '/'
    click_link 'Login'
    fill_in :email, with: 'user@sample.com'
    fill_in :password, with: 'Fake1234'
    click_button 'Login'
    should_see "You're logged"
  end

  scenario 'A user login fails' do
    visit '/'
    click_link 'Login'
    fill_in :email, with: 'user@sample.com'
    fill_in :password, with: 'WrongPassword'
    click_button 'Login'
    should_see 'Invalid email or password'
  end

  scenario 'A logged-in user logout' do
    login_as @user

    visit '/'
    click_link 'Logout'
    should_see "See you soon!"
    should_see 'Login'
  end

end
