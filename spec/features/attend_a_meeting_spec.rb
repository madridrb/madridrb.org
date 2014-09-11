require 'spec_helper'

feature 'Attendees' do

  background do
    recreate! :user
    recreate! :meeting
    @meeting = create :meeting, title: "First Madrid.rb meeting"
    @user = create :user, name: 'Paco Pérez'
  end

  context 'Logged user' do
    background do
      login_as @user
      visit '/'
    end

    scenario 'Attend a meeting' do
      click_on 'First Madrid.rb meeting'

      within '#attendees' do
        should_not_see 'Paco Pérez'
      end

      click_on 'Attend'

      within '#attendees' do
        should_see 'Paco Pérez'
      end
    end

    scenario 'Unattend a meeting' do
      @meeting.add_attendee(@user)

      click_on 'First Madrid.rb meeting'

      within '#attendees' do
        should_see 'Paco Pérez'
      end

      click_on 'Unattend'

      within '#attendees' do
        should_not_see 'Paco Pérez'
      end
    end
  end
end
