require 'spec_helper'

feature 'Meetings' do

  background do
    recreate! :meeting
    create :meeting, title: "First Madrid.rb meeting"
  end

  scenario 'A non-logged-in user browse all meetings' do
    visit '/'
    should_see 'First Madrid.rb meeting'
  end

  scenario 'A non-logged-in user browse a meeting' do
    visit '/meetings/first-madrid-rb-meeting'
    should_see 'First Madrid.rb meeting'
  end

end
