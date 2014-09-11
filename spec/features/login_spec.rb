require 'spec_helper'

feature 'Login' do

  background do
    recreate! :user
    @user = create :user, email: 'user@sample.com', password: 'Fake1234'
  end

  scenario 'A user login successfully' do
    visit '/'
    click_on 'log-in'
    fill_in :email, with: 'user@sample.com'
    fill_in :password, with: 'Fake1234'
    click_on 'submit'
    should_see "You're logged"
  end

  scenario 'A user login fails' do
    visit '/'
    click_on 'log-in'
    fill_in :email, with: 'user@sample.com'
    fill_in :password, with: 'WrongPassword'
    click_on 'submit'
    should_see 'Invalid email or password'
  end

  scenario 'A logged-in user logout' do
    login_as @user

    visit '/'
    click_on 'log-out'
    should_see "See you soon!"
  end

end
