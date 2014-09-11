require 'spec_helper'

feature 'Sign up' do

  background do
    recreate! :user
  end

  scenario 'Happy path' do
    visit '/'
    click_on 'sign-up'

    fill_in 'Name', with: 'Paco Pérez'
    fill_in 'Email', with: 'user@sample.com'
    fill_in 'Password', with: 'Fake1234'
    fill_in 'Password confirmation', with: 'Fake1234'
    click_on 'submit'

    should_see 'Paco Pérez'
  end

  scenario 'Validation error' do
    visit '/'
    click_on 'sign-up'

    fill_in 'Name', with: 'Paco Pérez'
    fill_in 'Email', with: 'user@sample.com'
    click_on 'submit'

    should_see 'Password no puede estar en blanco'
  end

end
