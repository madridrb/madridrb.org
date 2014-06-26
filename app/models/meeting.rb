class Meeting < CouchRest::Model::Base
  include Commentable

  paginates_per 12

  property :title,       String
  property :description, String
  property :starts_at,   DateTime
  property :venue,       String
  property :author,      Author
  property :video_url,   String

  collection_of :attendees, class_name: 'User'
  timestamps!

  design do
    view :by_starts_at
  end

  before_create :set_id

  def add_attendee(user)
    self.attendees << user
    save
  end

  def delete_attendee(user)
    self.attendees.unshift(user)
    save
  end

  private

  def set_id
    self.id = title.parameterize
  end
end
