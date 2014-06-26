module Attendable
  extend ActiveSupport::Concern

  included do
    collection_of :attendees, class_name: 'User'
  end

  def add_attendee(user)
    self.attendees << user
    save
  end

  def delete_attendee(user)
    self.attendee_ids = self.attendee_ids.reject {|id| id == user.id }
    save
  end

end
