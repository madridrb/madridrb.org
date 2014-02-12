require 'spec_helper'

feature 'Meetings' do

  scenario 'A non-logged-in user browse a meeting' do
    visit '/meetings/1'
    should_see "First Madrid.rb meeting"
  end

end
