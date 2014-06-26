require 'spec_helper'

feature 'Comment a meeting' do

  background do
    recreate! :user
    recreate! :meeting
    @meeting = create :meeting, title: "First Madrid.rb meeting"
    @user = create :user, name: 'Paco Pérez'
  end

  context 'Logged user' do
    background do
      login_as @user
    end

    scenario 'comment a meeting' do
      visit '/'
      click_link 'First Madrid.rb meeting'
      fill_in 'New comment', with: 'This is a comment on a meeting'
      click_button 'Create'

      should_see 'Paco Pérez'
      should_see 'This is a comment on a meeting'
    end

    scenario 'send blank comment' do
      visit '/'
      click_link 'First Madrid.rb meeting'
      click_button 'Create'
      should_see 'Comments no es válido'
    end

    scenario 'delete comment' do
      @meeting.add_comment @user, attributes_for(:comment, body: 'This is a comment')

      visit '/'
      click_link 'First Madrid.rb meeting'
      should_see 'This is a comment'
      click_link 'Delete'
      should_not_see 'This is a comment'
    end
  end

  context 'non-logged-in user' do
    scenario "Can't create new comments" do
      visit '/'
      click_link 'First Madrid.rb meeting'
      should_not_see 'New comment'
    end
  end
end
