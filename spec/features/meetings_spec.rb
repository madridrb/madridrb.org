require 'spec_helper'

feature 'Meetings' do

  background do
    Meeting.create(title: "First Madrid.rb meeting")
  end

  scenario 'A non-logged-in user browse a meeting' do
    visit '/meetings/first-madrid-rb-meeting'
    should_see "First Madrid.rb meeting"
  end

end
