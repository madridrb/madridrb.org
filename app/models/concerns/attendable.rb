module Attendable
  extend ActiveSupport::Concern

  included do
    collection_of :attendees, class_name: 'User'
  end

  def add_attendee(user)
    self.attendees << user
  end

  def delete_attendee(user)
    self.attendees.delete(user)
  end

end
