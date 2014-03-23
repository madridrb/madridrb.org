require 'spec_helper'

feature 'Comment a meeting' do

  background do
    recreate! :user
    recreate! :meeting
    create :meeting, title: "First Madrid.rb meeting"
    user = create :user
    login_as user
  end

  scenario 'Logged user comment a meeting' do
    visit '/'
    click_link 'First Madrid.rb meeting'

    fill_in 'Comment', with: 'This is a comment on a meeting'
    click_button 'Create'

    should_see 'This is a comment on a meeting'
  end
end
