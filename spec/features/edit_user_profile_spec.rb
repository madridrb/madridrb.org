require 'spec_helper'

feature 'Edit user profile' do

  background do
    recreate! :user
    @user = create :user, name: 'Paco Pérez'
  end

  scenario 'Logged in user' do
    login_as @user
    visit user_path(@user)
    
    click_link 'Edit'
    fill_in 'Name', with: 'Paquito Pérez'
    fill_in 'Email', with: 'paquito.perez@gmail.com'
    fill_in 'About', with: 'Una breve descripción'
    fill_in 'Url', with: 'http://www.pacoperez.com'
    fill_in 'Twitter', with: 'pacoperez'
    click_button 'Submit'

    should_see 'Paquito Pérez'
    should_not_see 'paquito.perez@gmail.com'
    should_see 'Una breve descripción'
    should_see 'http://www.pacoperez.com'
    should_see '@pacoperez'
  end
end
