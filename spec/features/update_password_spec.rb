require 'spec_helper'

feature 'Update password' do

  background do
    recreate! :user
    @user = create :user, name: 'Paco Pérez'

    login_as @user
    visit user_path(@user)
    click_on 'Edit password'
  end

  scenario 'happy path' do
    fill_in 'Password', with: 'FakePassword1'
    fill_in 'Password confirmation', with: 'FakePassword1'
    click_on 'Submit'
    should_be_on user_path(@user)
  end

  scenario 'validation error' do
    fill_in 'Password', with: 'FakePassword1'
    fill_in 'Password confirmation', with: 'FailPassword'
    click_on 'Submit'
    should_be_on users_password_path
  end
end
