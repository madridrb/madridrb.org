require 'spec_helper'

feature 'Sign up' do

  background do
    recreate! :user
  end

  scenario 'Happy path' do
    visit '/'
    click_link 'Sign up'

    fill_in 'Name', with: 'Paco Pérez'
    fill_in 'Email', with: 'user@sample.com'
    fill_in 'Password', with: 'Fake1234'
    fill_in 'Password confirmation', with: 'Fake1234'
    click_button 'Sign up'

    should_see 'Paco Pérez'
    should_see 'Logout'
  end

end
