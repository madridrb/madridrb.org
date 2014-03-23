require 'spec_helper'

feature 'Comment a meeting' do

  background do
    recreate! :user
    recreate! :meeting
    create :meeting, title: "First Madrid.rb meeting"
    @user = create :user, name: 'Paco Pérez'
  end

  context 'Logged user' do

    background do
      login_as @user

      visit '/'
      click_link 'First Madrid.rb meeting'
    end

    scenario 'Logged user comment a meeting' do
      fill_in 'Comment', with: 'This is a comment on a meeting'
      click_button 'Create'

      should_see 'Paco Pérez'
      should_see 'This is a comment on a meeting'
    end

    scenario 'Logged user send blank comment' do
      click_button 'Create'
      should_see 'Comments no es válido'
    end
  end
end
